import 'package:chat_app/core/network/network.dart';
import 'package:chat_app/core/network/network_implementation.dart';
import 'package:chat_app/features/template_feature/data/providers/remote/users_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

/// Get it instance
final GetIt getIt = GetIt.instance;

/// Registers dependencies required by the application asynchronously.
///
/// This method registers the network dependencies and providers needed by the
/// application using the `getIt` service locator.
/// - Calls `_network()` to initialize network-related dependencies.
/// - Calls `_provider()` to initialize provider-related dependencies.
Future<void> registerDependencies() async {
  await _network();
  _provider();
}

Future<void> _network() async {
  const supabaseUrl = 'https://pyjduiurropblpsqzgzs.supabase.co';
  const supabaseKey = String.fromEnvironment('SUPABASE_KEY');

  await Supabase.initialize(
    url: supabaseUrl,
    anonKey: supabaseKey,
  );

  getIt.registerLazySingleton<Network>(NetworkImpl.new);
}

void _provider() {
  getIt.registerLazySingleton<UsersProvider>(
    () => UsersProviderImpl(network: getIt()),
  );
}
