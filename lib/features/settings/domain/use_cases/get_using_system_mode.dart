import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

/// The [GetUsingSystemModeUseCase] class implements the use case for retrieving the system mode usage status.
/// This class follows the [UseCase] interface, using [bool] as the return type
/// and [NoParams] as the parameters type.
class GetUsingSystemModeUseCase implements UseCase<bool, NoParams> {
  /// Creates an instance of [GetUsingSystemModeUseCase].
  ///
  /// - `repository`: The repository that handles settings-related operations.
  const GetUsingSystemModeUseCase({
    required this.repository,
  });

  /// The repository that handles settings-related operations.
  final SettingsRepository repository;

  /// Calls the use case to retrieve the system mode usage status with the given parameters.
  ///
  /// This method uses the repository to get the system mode usage status and returns a [Future]
  /// of [Either] containing [Failure] or [bool].
  @override
  Future<Either<Failure, bool>> call(NoParams params) {
    return repository.getUsingSystemMode();
  }
}
