import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/settings/domain/entities/theme_color_entity/theme_color_entity.dart';
import 'package:chat_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:dartz/dartz.dart';

/// The [GetThemeColorUseCase] class implements the use case for retrieving the theme color.
/// This class follows the [UseCase] interface, using [ThemeColorEntity] as the return type
/// and [NoParams] as the parameters type.
class GetThemeColorUseCase implements UseCase<ThemeColorEntity, NoParams> {
  /// Creates an instance of [GetThemeColorUseCase].
  ///
  /// - `repository`: The repository that handles settings-related operations.
  const GetThemeColorUseCase({required this.repository});

  /// The repository that handles settings-related operations.
  final SettingsRepository repository;

  /// Calls the use case to retrieve the theme color with the given parameters.
  ///
  /// This method uses the repository to get the theme color and returns a [Future]
  /// of [Either] containing [Failure] or [ThemeColorEntity].
  @override
  Future<Either<Failure, ThemeColorEntity>> call(NoParams params) {
    return repository.getThemeColor();
  }
}
