import 'package:bloc/bloc.dart';
import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/core/widgets/modal_pop_up.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:chat_app/features/auth/domain/use_cases/get_user_use_case/get_user_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/logout_use_case/logout_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/registration_use_case/registration_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/update_user_use_case/update_user_use_case.dart';
import 'package:chat_app/utils/text_input_validator/text_input_validator.dart';
import 'package:flutter/cupertino.dart';

part 'auth_state.dart';

/// A Cubit for managing authentication state and actions.
class AuthCubit extends Cubit<AuthState> {
  /// Constructs an instance of [AuthCubit] with the necessary use cases.
  ///
  /// Parameters:
  ///   [registrationUseCase] The use case for user registration.
  ///   [loginUseCase] The use case for user login.
  ///   [logoutUseCase] The use case for user logout.
  ///   [getUserUseCase] The use case for retrieving user.
  ///   [updateUserUseCase] The use case for updating user details
  AuthCubit({
    required this.registrationUseCase,
    required this.loginUseCase,
    required this.logoutUseCase,
    required this.getUserUseCase,
    required this.updateUserUseCase,
    required this.onLogin,
    required this.onLogout,
  }) : super(const AuthState()) {
    _init();
  }

  /// The use case for user registration.
  final RegistrationUseCase registrationUseCase;

  /// The use case for user login.
  final LoginUseCase loginUseCase;

  /// The use case for user logout.
  final LogoutUseCase logoutUseCase;

  /// The use case for retrieving user.
  final GetUserUseCase getUserUseCase;

  /// The use case for updating user details
  final UpdateUserUseCase updateUserUseCase;

  /// Function that will be triggered when new user logs in
  final void Function() onLogin;

  /// Function that will be triggered when the current user logs out
  final void Function() onLogout;

  /// The current state of the authentication process.
  AuthState _state = const AuthState();

  Future<void> _init() async {
    final failureOrUser = await getUserUseCase(NoParams());

    failureOrUser.fold(
      (failure) => onLogout(),
      (entity) {
        _state = _state.copyWith(currentUser: entity);

        resetUserDetails();

        onLogin();
      },
    );

    emit(_state);

    getIt.signalReady(this);
  }

  /// Shows an authentication error message.
  void showAuthError(String authError) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (AppNavigation.rootNavigatorKey.currentContext == null) {
        return;
      }
      showCupertinoModalPopup<void>(
        context: AppNavigation.rootNavigatorKey.currentContext!,
        builder: (BuildContext context) {
          return ModalPopUpContainer(
            iconData: CupertinoIcons.exclamationmark_triangle_fill,
            message: authError,
          );
        },
      );
    });
  }

  /// Logs out the currently authenticated user.
  Future<void> logout() async {
    _state = _state.copyWith(authInProcess: true);
    emit(_state);

    final failureOrVoid = await logoutUseCase(NoParams());
    _state = const AuthState();

    failureOrVoid.fold(
      (failure) {
        showAuthError(failure.errorMessage);
      },
      (_) => null,
    );

    emit(_state);
    onLogout();
  }

  /// Checks if update params are valid
  bool checkUpdateParams() {
    final UpdateUserParams params = _state.updateUserParams;

    final String? name = params.name;

    if (name == null || name.length <= 2) {
      showAuthError('The name should be at least 2 characters.');
      return false;
    }
    return true;
  }

  /// Updates user details.
  Future<void> updateUser() async {
    final UpdateUserParams params = _state.updateUserParams;
    final UserEntity user = _state.currentUser;

    if (params.name == user.name && params.bio == user.bio) return;

    final UpdateUserParams newParams = UpdateUserParams(
      name: params.name == user.name ? null : params.name,
      bio: params.bio == user.bio ? null : params.bio,
    );

    final failureOrUser = await updateUserUseCase(newParams);

    failureOrUser.fold(
      (failure) => showAuthError(failure.errorMessage),
      (entity) {
        _state = _state.copyWith(currentUser: entity);
        resetUserDetails();

        emit(_state);
      },
    );
  }

  /// Resets user details after input operations.
  void resetUserDetails() {
    final UserEntity user = _state.currentUser;
    _state = _state.copyWith(
      updateUserParams: UpdateUserParams(
        name: user.name,
        bio: user.bio,
      ),
    );

    emit(_state);
  }

  /// Checks if the login parameters are valid.
  bool checkLoginParams() {
    final LoginParams loginParams = _state.loginParams;

    final String email = loginParams.email;
    final String password = loginParams.password;

    if (TextInputValidator.validateEmail(email) != null || email.isEmpty) {
      return false;
    }

    if (password.isEmpty) {
      return false;
    }
    return true;
  }

  /// Checks if the registration parameters are valid.
  bool checkRegistrationParams() {
    final RegistrationParams registrationParams = _state.registrationParams;

    final String name = registrationParams.name;
    final String email = registrationParams.email;
    final String password = registrationParams.password;

    if (TextInputValidator.validateName(name) != null || name.isEmpty) {
      return false;
    }

    if (TextInputValidator.validateEmail(email) != null || email.isEmpty) {
      return false;
    }

    if (TextInputValidator.validatePassword(password) != null ||
        password.isEmpty) {
      return false;
    }

    return true;
  }

  /// Updates the email parameter for login.
  void onLoginEmail(String email) {
    final LoginParams loginParams = _state.loginParams;
    _state = _state.copyWith(
      loginParams: loginParams.copyWith(email: email),
    );
    emit(_state);
  }

  /// Updates the password parameter for login.
  void onLoginPassword(String password) {
    final LoginParams loginParams = _state.loginParams;
    _state = _state.copyWith(
      loginParams: loginParams.copyWith(password: password),
    );
    emit(_state);
  }

  /// Updates the name parameter for registration.
  void onRegistrationName(String name) {
    final RegistrationParams registrationParams = _state.registrationParams;
    _state = _state.copyWith(
      registrationParams: registrationParams.copyWith(name: name),
    );
    emit(_state);
  }

  /// Updates the email parameter for registration.
  void onRegistrationEmail(String email) {
    final RegistrationParams registrationParams = _state.registrationParams;
    _state = _state.copyWith(
      registrationParams: registrationParams.copyWith(email: email),
    );
    emit(_state);
  }

  /// Updates the password parameter for registration.
  void onRegistrationPassword(String password) {
    final RegistrationParams registrationParams = _state.registrationParams;
    _state = _state.copyWith(
      registrationParams: registrationParams.copyWith(password: password),
    );
    emit(_state);
  }

  /// Updates the user's name and emits the new state.
  void onUpdateName(String name) {
    final UpdateUserParams params = _state.updateUserParams;
    _state = _state.copyWith(updateUserParams: params.copyWith(name: name));
    emit(_state);
  }

  /// Updates the user's bio and emits the new state.
  void onUpdateBio(String bio) {
    final UpdateUserParams params = _state.updateUserParams;
    _state = _state.copyWith(updateUserParams: params.copyWith(bio: bio));
    emit(_state);
  }

  /// Handles the login button press event.
  Future<void> onLoginButton() async {
    if (!checkLoginParams()) {
      _state = _state.copyWith();
      showAuthError('The data you entered is incorrect. Please try again.');
      emit(_state);
      return;
    }

    _state = _state.copyWith(authInProcess: true);
    emit(_state);

    final failureOrToken = await loginUseCase(_state.loginParams);

    await failureOrToken.fold(
      (failure) {
        showAuthError(failure.errorMessage);
      },
      (user) async {
        _state = _state.copyWith(currentUser: user);
      },
    );

    _state = _state.copyWith(authInProcess: false);
    emit(_state);
    onLogin();
  }

  /// Handles the registration button press event.
  Future<void> onRegistrationButton() async {
    if (!checkRegistrationParams()) {
      showAuthError('The data you entered is incorrect. Please try again.');
      return;
    }

    _state = _state.copyWith(authInProcess: true);
    emit(_state);

    final failureOrToken = await registrationUseCase(_state.registrationParams);

    failureOrToken.fold(
      (failure) {
        showAuthError(failure.errorMessage);
      },
      (user) {
        _state = _state.copyWith(currentUser: user);
      },
    );

    _state = _state.copyWith(authInProcess: false);
    emit(_state);
    onLogin();
  }

  /// Toggles the visibility of the password.
  void onHidePassword() {
    _state = _state.copyWith(hidePassword: !_state.hidePassword);
    emit(_state);
  }
}
