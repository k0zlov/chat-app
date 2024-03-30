import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/settings/domain/entities/theme_color_entity/theme_color_entity.dart';
import 'package:chat_app/features/settings/domain/entities/theme_mode_entity/theme_mode_entity.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_color.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_mode.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_using_system_mode.dart';
import 'package:dartz/dartz.dart';

abstract class SettingsRepository {
  Future<Either<Failure, ThemeColorEntity>> getThemeColor();

  Future<Either<Failure, ThemeModeEntity>> getThemeMode();

  Future<Either<Failure, bool>> getUsingSystemMode();

  Future<Either<Failure, void>> setThemeColor(
    ChangeThemeColorParams params,
  );

  Future<Either<Failure, void>> setThemeMode(
    ChangeThemeModeParams params,
  );

  Future<Either<Failure, void>> setUsingSystemMode(
    ChangeUsingSystemModeParams params,
  );
}
