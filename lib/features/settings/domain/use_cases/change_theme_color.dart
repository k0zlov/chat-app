import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

/// The [ChangeThemeColorUseCase] class implements the use case for changing the theme color.
/// This class follows the [UseCase] interface, with `void` as the return type
/// and [ChangeThemeColorParams] as the parameters type.
class ChangeThemeColorUseCase implements UseCase<void, ChangeThemeColorParams> {
  /// Creates an instance of [ChangeThemeColorUseCase].
  ///
  /// - `repository`: The repository that handles settings-related operations.
  ChangeThemeColorUseCase({required this.repository});

  /// The repository that handles settings-related operations.
  final SettingsRepository repository;

  /// Calls the use case to change the theme color with the given parameters.
  ///
  /// This method uses the repository to set the theme color and returns a [Future]
  /// of [Either] containing [Failure] or `void`.
  @override
  Future<Either<Failure, void>> call(ChangeThemeColorParams params) {
    return repository.setThemeColor(params);
  }
}

/// The [ChangeThemeColorParams] class represents the parameters required to change the theme color.
class ChangeThemeColorParams {
  /// Creates a [ChangeThemeColorParams] instance.
  ///
  /// - `color`: The new theme color to be set.
  const ChangeThemeColorParams({
    required this.color,
  });

  /// The new theme color to be set.
  final AppThemeColor color;
}
