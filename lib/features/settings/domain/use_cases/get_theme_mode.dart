import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/settings/domain/entities/theme_mode_entity/theme_mode_entity.dart';
import 'package:chat_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

/// The [GetThemeModeUseCase] class implements the use case for retrieving the theme mode.
/// This class follows the [UseCase] interface, using [ThemeModeEntity] as the return type
/// and [NoParams] as the parameters type.
class GetThemeModeUseCase implements UseCase<ThemeModeEntity, NoParams> {
  /// Creates an instance of [GetThemeModeUseCase].
  ///
  /// - `repository`: The repository that handles settings-related operations.
  const GetThemeModeUseCase({required this.repository});

  /// The repository that handles settings-related operations.
  final SettingsRepository repository;

  /// Calls the use case to retrieve the theme mode with the given parameters.
  ///
  /// This method uses the repository to get the theme mode and returns a [Future]
  /// of [Either] containing [Failure] or [ThemeModeEntity].
  @override
  Future<Either<Failure, ThemeModeEntity>> call(NoParams params) {
    return repository.getThemeMode();
  }
}
