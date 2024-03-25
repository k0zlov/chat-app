import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/core/services/theme_service.dart';
import 'package:chat_app/features/settings/domain/entities/theme_color_entity/theme_color_entity.dart';
import 'package:chat_app/features/settings/domain/entities/theme_mode_entity/theme_mode_entity.dart';
import 'package:chat_app/features/settings/domain/repositories/settings_repository.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_color.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_mode.dart';
import 'package:chat_app/utils/enum_parsing/enum_parsing_extension.dart';
import 'package:dartz/dartz.dart';

class SettingsRepositoryImpl implements SettingsRepository {
  const SettingsRepositoryImpl({required this.themeService});

  final ThemeService themeService;

  @override
  Future<Either<Failure, ThemeColorEntity>> getThemeColor() async {
    try {
      final String? colorName = themeService.getThemeColor();

      final AppThemeColor? themeColor = AppThemeColor.values.valueFromString(
        colorName,
      );

      final ThemeColorEntity entity = ThemeColorEntity(
        color: themeColor ?? AppThemeColor.standart,
      );

      return Right(entity);
    } catch (e) {
      const cacheFailure = CacheFailure(
        errorMessage: 'Could not get theme color.',
      );

      return const Left(cacheFailure);
    }
  }

  @override
  Future<Either<Failure, ThemeModeEntity>> getThemeMode() async {
    try {
      final String? modeName = themeService.getThemeMode();

      print(modeName);

      final AppThemeMode? themeMode = AppThemeMode.values.valueFromString(
        modeName,
      );
      print(2);

      final ThemeModeEntity entity = ThemeModeEntity(
        mode: themeMode ?? AppThemeMode.system,
      );
      print(3);

      return Right(entity);
    } catch (e) {
      const cacheFailure = CacheFailure(
        errorMessage: 'Could not get theme mode.',
      );

      return const Left(cacheFailure);
    }
  }

  @override
  Future<Either<Failure, void>> setThemeColor(
    ChangeThemeColorParams params,
  ) async {
    try {
      await themeService.setThemeColor(themeColor: params.color.name);
      return const Right(null);
    } catch (e) {
      const cacheFailure = CacheFailure(
        errorMessage: 'Could not set theme color.',
      );

      return const Left(cacheFailure);
    }
  }

  @override
  Future<Either<Failure, void>> setThemeMode(
    ChangeThemeModeParams params,
  ) async {
    try {
      await themeService.setThemeMode(themeMode: params.mode.name);
      return const Right(null);
    } catch (e) {
      const cacheFailure = CacheFailure(
        errorMessage: 'Could not set theme mode.',
      );

      return const Left(cacheFailure);
    }
  }
}
