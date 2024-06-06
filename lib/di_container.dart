import 'package:chat_app/core/database/database_helper.dart';
import 'package:chat_app/core/database/database_helper_impl.dart';
import 'package:chat_app/core/network/dio_interceptor.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/core/network/network_dio.dart';
import 'package:chat_app/core/services/auth_service.dart';
import 'package:chat_app/features/auth/auth_feature.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/data/providers/local/messages_local_provider.dart';
import 'package:chat_app/features/chats/data/providers/remote/messages_remote_provider.dart';
import 'package:chat_app/features/chats/domain/use_cases/send_message_use_case/send_message_use_case.dart';
import 'package:chat_app/features/contacts/contacts_feature.dart';
import 'package:chat_app/features/settings/settings_feature.dart';
import 'package:chat_app/utils/hive/hive_box.dart';
import 'package:get_it/get_it.dart';

/// Singleton instance of GetIt for dependency injection.
///
/// Enables the application to access shared instances of classes,
/// facilitating a loosely coupled architecture by providing a centralized
/// point of access for dependencies.
final GetIt getIt = GetIt.instance;

/// Initializes and registers the application's dependencies asynchronously.
///
/// This setup function is crucial for preparing the application's infrastructure,
/// including supabase configurations, local database setup, and the registration of
/// both local and remote contacts providers.
Future<void> registerDependencies() async {
  await _database(); // Configures the database and its handler.

  await _hive();
  _services();

  _interceptor();
  _network();

  _localProviders(); // Registers contacts providers for different features.
  _remoteProviders();

  _repositories();
  _useCases();

  _cubits();

  // Waits for all asynchronous registrations to complete before proceeding.
  await getIt.allReady();
}

/// Configures and registers the database helper.
///
/// The database handler is setup as a singleton that signals its readiness,
/// ensuring dependent components wait for the database to be fully initialized.
Future<void> _database() async {
  getIt.registerSingletonAsync<DatabaseHelper>(
    signalsReady: true,
    () async => DatabaseHelperImpl(),
  );
}

/// Initializes Hive database and registers its singleton with the service locator.
Future<void> _hive() async {
  await HiveBox.initHive();
  getIt.registerSingleton<HiveBox>(HiveBox());
}

/// Registers authentication service as a lazy singleton with the service locator.
void _services() {
  getIt.registerLazySingleton<AuthService>(
    () => AuthServiceImpl(hiveBox: getIt()),
  );
}

/// Registers a custom Dio interceptor as a lazy singleton for HTTP request manipulation.
void _interceptor() {
  getIt.registerLazySingleton<DioInterceptor>(
    () => DioInterceptor(authService: getIt()),
  );
}

/// Sets up the network layer with a base URL and registers it as a lazy singleton.
void _network() {
  const String spaBaseUrl = String.fromEnvironment('SPA_BASE_URL');
  getIt.registerLazySingleton<Network>(
    () => NetworkImplDio(
      baseUrl: spaBaseUrl,
      interceptor: getIt(),
    ),
  );
}

/// Placeholder for registering local contacts providers (currently empty).
void _localProviders() {
  getIt
    ..registerLazySingleton<SettingsLocalDataProvider>(
      () => SettingsLocalDataProviderImpl(hiveBox: getIt()),
    )
    ..registerLazySingleton<ChatParticipantsLocalProvider>(
      () => ChatParticipantsLocalProviderImpl(database: getIt()),
    )
    ..registerLazySingleton<ChatsLocalProvider>(
      () => ChatsLocalProviderImpl(database: getIt()),
    )
    ..registerLazySingleton<MessagesLocalProvider>(
      () => MessagesLocalProviderImpl(database: getIt()),
    )
    ..registerLazySingleton<ContactsLocalProvider>(
      () => ContactsLocalProviderImpl(database: getIt()),
    );
}

/// Registers remote contacts providers, such as `AuthRemoteProvider`, as lazy singletons.
void _remoteProviders() {
  getIt
    ..registerLazySingleton<AuthRemoteProvider>(
      () => AuthRemoteProviderImpl(network: getIt()),
    )
    ..registerLazySingleton<ChatsRemoteProvider>(
      () => ChatsRemoteProviderImpl(network: getIt()),
    )
    ..registerLazySingleton<MessagesRemoteProvider>(
      () => MessagesRemoteProviderImpl(network: getIt()),
    )
    ..registerLazySingleton<ContactsRemoteProvider>(
      () => ContactsRemoteProviderImpl(network: getIt()),
    );
}

/// Registers repositories, such as `AuthRepository`, as lazy singletons to handle contacts operations.
void _repositories() {
  getIt
    ..registerLazySingleton<AuthRepository>(
      () => AuthRepositoryImpl(
        remoteProvider: getIt(),
        authService: getIt(),
      ),
    )
    ..registerLazySingleton<ChatsRepository>(
      () => ChatsRepositoryImpl(
        localProvider: getIt(),
        remoteProvider: getIt(),
        participantsLocalProvider: getIt(),
        messagesLocalProvider: getIt(),
        messagesRemoteProvider: getIt(),
      ),
    )
    ..registerLazySingleton<SettingsRepository>(
      () => SettingsRepositoryImpl(localProvider: getIt()),
    )
    ..registerLazySingleton<ContactsRepository>(
      () => ContactsRepositoryImpl(
        remoteProvider: getIt(),
        localProvider: getIt(),
      ),
    );
}

/// Registers use cases that encapsulate business logic as lazy singletons.
void _useCases() {
  getIt
    ..registerLazySingleton<RegistrationUseCase>(
      () => RegistrationUseCase(repository: getIt()),
    )
    ..registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(repository: getIt()),
    )
    ..registerLazySingleton<LogoutUseCase>(
      () => LogoutUseCase(repository: getIt()),
    )
    ..registerLazySingleton<ChangeThemeColorUseCase>(
      () => ChangeThemeColorUseCase(repository: getIt()),
    )
    ..registerLazySingleton<GetThemeColorUseCase>(
      () => GetThemeColorUseCase(repository: getIt()),
    )
    ..registerLazySingleton<ChangeThemeModeUseCase>(
      () => ChangeThemeModeUseCase(repository: getIt()),
    )
    ..registerLazySingleton<GetThemeModeUseCase>(
      () => GetThemeModeUseCase(repository: getIt()),
    )
    ..registerLazySingleton<ChangeUsingSystemModeUseCase>(
      () => ChangeUsingSystemModeUseCase(repository: getIt()),
    )
    ..registerLazySingleton<GetUsingSystemModeUseCase>(
      () => GetUsingSystemModeUseCase(repository: getIt()),
    )
    ..registerLazySingleton<FetchContactsUseCase>(
      () => FetchContactsUseCase(repository: getIt()),
    )
    ..registerLazySingleton<AddContactUseCase>(
      () => AddContactUseCase(repository: getIt()),
    )
    ..registerLazySingleton<GetSavedContactsUseCase>(
      () => GetSavedContactsUseCase(repository: getIt()),
    )
    ..registerLazySingleton<GetUserChatsUseCase>(
      () => GetUserChatsUseCase(repository: getIt()),
    )
    ..registerLazySingleton<GetSavedChatsUseCase>(
      () => GetSavedChatsUseCase(repository: getIt()),
    )
    ..registerLazySingleton<CreateChatUseCase>(
      () => CreateChatUseCase(repository: getIt()),
    )
    ..registerLazySingleton<JoinChatUseCase>(
      () => JoinChatUseCase(repository: getIt()),
    )
    ..registerLazySingleton<LeaveChatUseCase>(
      () => LeaveChatUseCase(repository: getIt()),
    )
    ..registerLazySingleton<SendMessageUseCase>(
      () => SendMessageUseCase(repository: getIt()),
    )
    ..registerLazySingleton<RemoveContactUseCase>(
      () => RemoveContactUseCase(repository: getIt()),
    );
}

/// Registers Cubits (state management) as lazy singletons to manage and distribute application state.
void _cubits() {
  getIt
    ..registerLazySingleton<AuthCubit>(
      () => AuthCubit(
        registrationUseCase: getIt(),
        loginUseCase: getIt(),
        logoutUseCase: getIt(),
      ),
    )
    ..registerLazySingleton<ContactsCubit>(
      () => ContactsCubit(
        addContactUseCase: getIt(),
        removeContactUseCase: getIt(),
        fetchContactsUseCase: getIt(),
        getSavedContactsUseCase: getIt(),
      ),
    )
    ..registerLazySingleton<ChatsCubit>(
      () => ChatsCubit(
        getUserChatsUseCase: getIt(),
        getSavedChatsUseCase: getIt(),
        createChatUseCase: getIt(),
        joinChatUseCase: getIt(),
        leaveChatUseCase: getIt(),
        sendMessageUseCase: getIt(),
      ),
    )
    ..registerSingletonAsync<SettingsCubit>(
      signalsReady: true,
      () async => SettingsCubit(
        changeThemeColor: getIt(),
        changeThemeMode: getIt(),
        changeUsingSystemMode: getIt(),
        getThemeColor: getIt(),
        getThemeMode: getIt(),
        getUsingSystemMode: getIt(),
      ),
    );
}
