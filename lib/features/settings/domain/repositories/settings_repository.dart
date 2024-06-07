import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/settings/domain/entities/theme_color_entity/theme_color_entity.dart';
import 'package:chat_app/features/settings/domain/entities/theme_mode_entity/theme_mode_entity.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_color.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_mode.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_using_system_mode.dart';
import 'package:dartz/dartz.dart';

/// Abstract class for the settings repository.
/// This class defines the contract for methods to get and set theme color,
/// theme mode, and system mode usage.
abstract class SettingsRepository {
  /// Gets the current theme color.
  ///
  /// Returns a [Future] of [Either] containing [Failure] or [ThemeColorEntity].
  Future<Either<Failure, ThemeColorEntity>> getThemeColor();

  /// Gets the current theme mode.
  ///
  /// Returns a [Future] of [Either] containing [Failure] or [ThemeModeEntity].
  Future<Either<Failure, ThemeModeEntity>> getThemeMode();

  /// Gets the current status of using system mode.
  ///
  /// Returns a [Future] of [Either] containing [Failure] or a [bool] indicating
  /// whether the system mode is being used.
  Future<Either<Failure, bool>> getUsingSystemMode();

  /// Sets the theme color with the given parameters.
  ///
  /// - `params`: The parameters required to change the theme color.
  ///
  /// Returns a [Future] of [Either] containing [Failure] or `void`.
  Future<Either<Failure, void>> setThemeColor(
      ChangeThemeColorParams params,
      );

  /// Sets the theme mode with the given parameters.
  ///
  /// - `params`: The parameters required to change the theme mode.
  ///
  /// Returns a [Future] of [Either] containing [Failure] or `void`.
  Future<Either<Failure, void>> setThemeMode(
      ChangeThemeModeParams params,
      );

  /// Sets the status of using system mode with the given parameters.
  ///
  /// - `params`: The parameters required to change the system mode usage.
  ///
  /// Returns a [Future] of [Either] containing [Failure] or `void`.
  Future<Either<Failure, void>> setUsingSystemMode(
      ChangeUsingSystemModeParams params,
      );
}
