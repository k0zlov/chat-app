import 'package:chat_app/core/database/database.dart';
import 'package:chat_app/core/database/database_implementation.dart';
import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/core/network/network_implementation.dart';
import 'package:chat_app/features/template_feature/data/providers/local/chatparticipants_local_provider.dart';
import 'package:chat_app/features/template_feature/data/providers/local/chats_local_provider.dart';
import 'package:chat_app/features/template_feature/data/providers/local/contacts_local_provider.dart';
import 'package:chat_app/features/template_feature/data/providers/local/messages_local_provider.dart';
import 'package:chat_app/features/template_feature/data/providers/local/users_local_provider.dart';
import 'package:chat_app/features/template_feature/data/providers/remote/users_remote_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Singleton instance of GetIt for dependency injection.
///
/// Enables the application to access shared instances of classes,
/// facilitating a loosely coupled architecture by providing a centralized
/// point of access for dependencies.
final GetIt getIt = GetIt.instance;

/// Initializes and registers the application's dependencies asynchronously.
///
/// This setup function is crucial for preparing the application's infrastructure,
/// including network configurations, database setup, and the registration of
/// both local and remote data providers.
Future<void> registerDependencies() async {
  await _network(); // Initializes network configurations.
  await _database(); // Configures the database and its handler.
  _providers(); // Registers data providers for different features.

  // Waits for all asynchronous registrations to complete before proceeding.
  await getIt.allReady();
}

/// Sets up network configurations and registers the network handler.
///
/// Initializes Supabase with necessary configurations and registers the
/// network implementation as a lazy singleton, ensuring efficient usage
/// across the application.
Future<void> _network() async {
  // Supabase configuration constants.
  const supabaseUrl = 'https://pyjduiurropblpsqzgzs.supabase.co';
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

  // Initializes Supabase client with the provided URL and anonKey.
  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  // Registers the network implementation to be used for API calls.
  getIt.registerLazySingleton<Network>(NetworkImpl.new);
}

/// Registers all local and remote data provider dependencies.
///
/// Providers are registered as lazy singletons, optimizing resource usage by
/// instantiating them only when needed. Each provider handles specific data
/// operations for its associated feature.
void _providers() {
  getIt
    ..registerLazySingleton<UsersRemoteProvider>(
          () => UsersRemoteProviderImpl(network: getIt()),
    )
    ..registerLazySingleton<ChatsLocalProvider>(
          () => ChatsLocalProviderImpl(databaseHandler: getIt()),
    )
    ..registerLazySingleton<MessagesLocalProvider>(
          () => MessagesLocalProviderImpl(databaseHandler: getIt()),
    )
    ..registerLazySingleton<UsersLocalProvider>(
          () => UsersLocalProviderImpl(databaseHandler: getIt()),
    )
    ..registerLazySingleton<ChatParticipantsLocalProvider>(
          () => ChatParticipantsLocalProviderImpl(databaseHandler: getIt()),
    )
    ..registerLazySingleton<ContactsLocalProvider>(
          () => ContactsLocalProviderImpl(databaseHandler: getIt()),
    );
}

/// Configures and registers the database handler.
///
/// The database handler is setup as a singleton that signals its readiness,
/// ensuring dependent components wait for the database to be fully initialized.
Future<void> _database() async {
  getIt.registerSingletonAsync<DatabaseHandler>(
    signalsReady: true,
        () async => DatabaseHandlerImpl(),
  );
}
