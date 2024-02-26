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

/// GetIt instance for service location.
///
/// This is used across the application to manage dependency injection,
/// ensuring that classes have access to the instances they need without
/// being tightly coupled to their creation.
final GetIt getIt = GetIt.instance;

/// Asynchronously registers all necessary dependencies for the application.
///
/// This includes setting up network configurations, initializing the database,
/// and registering providers for data handling. It leverages Dart's `Future`
/// to perform asynchronous operations, ensuring non-blocking initialization.
Future<void> registerDependencies() async {
  await _network(); // Initialize network-related dependencies.
  await _database(); // Set up database configurations.
  _providers(); // Register various data providers.

  // Ensures all async dependencies are ready before proceeding.
  await getIt.allReady();
}

/// Configures network dependencies, including initializing Supabase.
///
/// Supabase is set up with its URL and anonKey, which are essential for
/// accessing its backend services. The `NetworkImpl` is then registered
/// as a lazy singleton, ensuring a single instance is used throughout the app.
Future<void> _network() async {
  const supabaseUrl = 'https://pyjduiurropblpsqzgzs.supabase.co';
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  getIt.registerLazySingleton<Network>(NetworkImpl.new);
}

/// Registers provider dependencies for data handling.
///
/// Providers for users, chats, and messages are registered as lazy singletons,
/// meaning their instantiation is deferred until they are needed, optimizing
/// resource usage. Each provider is responsible for handling specific data
/// operations related to its domain.
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

/// Sets up and registers the database handler.
///
/// The `DatabaseHandlerImpl` is registered as a singleton that signals
/// when it's ready, ensuring that dependent components wait for its
/// initialization before proceeding.
Future<void> _database() async {
  getIt.registerSingletonAsync<DatabaseHandler>(
    signalsReady: true,
    () async => DatabaseHandlerImpl(),
  );
}
