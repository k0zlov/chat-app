import 'package:chat_app/core/database/database_handler.dart';
import 'package:chat_app/core/database/database_handler_implementation.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/core/network/network_implementation.dart';
import 'package:chat_app/features/auth/data/providers/remote/auth_remote_provider.dart';
import 'package:chat_app/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:chat_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:chat_app/features/auth/domain/use_cases/login_use_case/login_use_case.dart';
import 'package:chat_app/features/auth/domain/use_cases/registration_use_case/registration_use_case.dart';
import 'package:chat_app/features/auth/view/cubit/auth_cubit/auth_cubit.dart';
import 'package:chat_app/features/template_feature/data/providers/local/chatparticipants_local_provider.dart';
import 'package:chat_app/features/template_feature/data/providers/local/chats_local_provider.dart';
import 'package:chat_app/features/template_feature/data/providers/local/contacts_local_provider.dart';
import 'package:chat_app/features/template_feature/data/providers/local/messages_local_provider.dart';
import 'package:chat_app/features/template_feature/data/providers/local/users_local_provider.dart';
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
/// both local and remote data providers.
Future<void> registerDependencies() async {
  await _database(); // Configures the database and its handler.
  await _hive();
  _localProviders(); // Registers data providers for different features.

  _network();
  _remoteProviders();

  _repositories();
  _useCases();

  _cubits();

  // Waits for all asynchronous registrations to complete before proceeding.
  await getIt.allReady();
}

Future<void> _hive() async {
  await HiveBoxMixin.initHive();
  getIt.registerSingleton<HiveBoxMixin>(HiveBoxMixin());
}

void _cubits() {
  getIt.registerLazySingleton<AuthCubit>(
    () => AuthCubit(
      registrationUseCase: getIt(),
      loginUseCase: getIt(),
    ),
  );
}

void _useCases() {
  getIt
    ..registerLazySingleton<RegistrationUseCase>(
      () => RegistrationUseCase(repository: getIt()),
    )
    ..registerLazySingleton<LoginUseCase>(
      () => LoginUseCase(repository: getIt()),
    );
}

void _repositories() {
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(
      remoteProvider: getIt(),
      hiveBoxMixin: getIt(),
    ),
  );
}

void _remoteProviders() {
  getIt.registerLazySingleton<AuthRemoteProvider>(
    () => AuthRemoteProviderImpl(network: getIt()),
  );
}

/// Registers all local and remote data provider dependencies.
///
/// Providers are registered as lazy singletons, optimizing resource usage by
/// instantiating them only when needed. Each provider handles specific data
/// operations for its associated feature.
void _localProviders() {
  getIt
    ..registerLazySingleton<ChatsLocalProvider>(
      () => ChatsLocalProviderImpl(databaseHelper: getIt()),
    )
    ..registerLazySingleton<MessagesLocalProvider>(
      () => MessagesLocalProviderImpl(databaseHelper: getIt()),
    )
    ..registerLazySingleton<UsersLocalProvider>(
      () => UsersLocalProviderImpl(databaseHelper: getIt()),
    )
    ..registerLazySingleton<ChatParticipantsLocalProvider>(
      () => ChatParticipantsLocalProviderImpl(databaseHelper: getIt()),
    )
    ..registerLazySingleton<ContactsLocalProvider>(
      () => ContactsLocalProviderImpl(databaseHelper: getIt()),
    );
}

void _network() {
  const String spaBaseUrl = String.fromEnvironment('SPA_BASE_URL');
  getIt.registerLazySingleton<Network>(
    () => NetworkImpl(
      baseUrl: spaBaseUrl,
    ),
  );
}

/// Configures and registers the database handler.
///
/// The database handler is setup as a singleton that signals its readiness,
/// ensuring dependent components wait for the database to be fully initialized.
Future<void> _database() async {
  getIt.registerSingletonAsync<DatabaseHelper>(
    signalsReady: true,
    () async => DatabaseHelperImpl(),
  );
}
