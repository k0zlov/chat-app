import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/settings/settings_feature.dart';
import 'package:dartz/dartz.dart';

/// The [ChangeUsingSystemModeUseCase] class implements the use case for changing the system mode usage.
/// This class follows the [UseCase] interface, with `void` as the return type
/// and [ChangeUsingSystemModeParams] as the parameters type.
class ChangeUsingSystemModeUseCase
    implements UseCase<void, ChangeUsingSystemModeParams> {
  /// Creates an instance of [ChangeUsingSystemModeUseCase].
  ///
  /// - `repository`: The repository that handles settings-related operations.
  const ChangeUsingSystemModeUseCase({
    required this.repository,
  });

  /// The repository that handles settings-related operations.
  final SettingsRepository repository;

  /// Calls the use case to change the system mode usage with the given parameters.
  ///
  /// This method uses the repository to set the system mode usage and returns a [Future]
  /// of [Either] containing [Failure] or `void`.
  @override
  Future<Either<Failure, void>> call(ChangeUsingSystemModeParams params) {
    return repository.setUsingSystemMode(params);
  }
}

/// The [ChangeUsingSystemModeParams] class represents the parameters required to change the system mode usage.
class ChangeUsingSystemModeParams {
  /// Creates a [ChangeUsingSystemModeParams] instance.
  ///
  /// - `usingSystemMode`: A boolean indicating whether to use the system mode.
  const ChangeUsingSystemModeParams({required this.usingSystemMode});

  /// A boolean indicating whether to use the system mode.
  final bool usingSystemMode;
}
