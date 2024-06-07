import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/features/settings/data/models/theme_color_model/theme_color_model.dart';
import 'package:chat_app/features/settings/data/models/theme_mode_model/theme_mode_model.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_color.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_mode.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_using_system_mode.dart';
import 'package:chat_app/utils/hive/hive_box.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

/// Abstract class for local data provider related to settings.
/// This class defines the contract for methods to get and set theme mode,
/// theme color, and system mode usage.
abstract class SettingsLocalDataProvider {
  /// Gets the current theme mode from local storage.
  Future<Either<Failure, ThemeModeModel>> getThemeMode();

  /// Sets the theme mode in local storage with the given parameters.
  Future<Either<Failure, void>> setThemeMode(
    ChangeThemeModeParams params,
  );

  /// Gets the current status of using system mode from local storage.
  Future<Either<Failure, bool>> getUsingSystemMode();

  /// Sets the status of using system mode in local storage with the given parameters.
  Future<Either<Failure, void>> setUsingSystemMode(
    ChangeUsingSystemModeParams params,
  );

  /// Gets the current theme color from local storage.
  Future<Either<Failure, ThemeColorModel>> getThemeColor();

  /// Sets the theme color in local storage with the given parameters.
  Future<Either<Failure, void>> setThemeColor(
    ChangeThemeColorParams params,
  );
}

/// Implementation of [SettingsLocalDataProvider] using Hive for local storage.
class SettingsLocalDataProviderImpl implements SettingsLocalDataProvider {
  /// Creates an instance of [SettingsLocalDataProviderImpl].
  ///
  /// - `hiveBox`: The HiveBox instance to handle local storage operations.
  const SettingsLocalDataProviderImpl({required this.hiveBox});

  /// The HiveBox instance to handle local storage operations.
  final HiveBox hiveBox;

  @override
  Future<Either<Failure, ThemeModeModel>> getThemeMode() async {
    try {
      final String? modeName = hiveBox.getData(HiveBoxKeys.themeMode);

      final ThemeModeModel model = ThemeModeModel(
        modeName: modeName ?? ThemeMode.light.name,
      );
      return Right(model);
    } catch (e) {
      const cacheFailure = CacheFailure(
        errorMessage: 'Could not get theme mode.',
      );

      return const Left(cacheFailure);
    }
  }

  @override
  Future<Either<Failure, void>> setThemeMode(
    ChangeThemeModeParams params,
  ) async {
    try {
      await hiveBox.addData(HiveBoxKeys.themeMode, params.mode.name);
      return const Right(null);
    } catch (e) {
      const cacheFailure = CacheFailure(
        errorMessage: 'Could not set new value for theme mode.',
      );

      return const Left(cacheFailure);
    }
  }

  @override
  Future<Either<Failure, bool>> getUsingSystemMode() async {
    try {
      final bool? usingSystemBrightness = hiveBox.getData(
        HiveBoxKeys.isUsingSystemBrightness,
      );

      return Right(usingSystemBrightness ?? true);
    } catch (e) {
      const cacheFailure = CacheFailure(
        errorMessage: 'Could not get data about using system theme mode.',
      );

      return const Left(cacheFailure);
    }
  }

  @override
  Future<Either<Failure, void>> setUsingSystemMode(
    ChangeUsingSystemModeParams params,
  ) async {
    try {
      await hiveBox.addData(
        HiveBoxKeys.isUsingSystemBrightness,
        params.usingSystemMode,
      );
      return const Right(null);
    } catch (e) {
      const cacheFailure = CacheFailure(
        errorMessage: 'Could not set new value for using system theme mode.',
      );

      return const Left(cacheFailure);
    }
  }

  @override
  Future<Either<Failure, ThemeColorModel>> getThemeColor() async {
    try {
      final String? colorName = hiveBox.getData(
        HiveBoxKeys.themeColor,
      );

      final ThemeColorModel model = ThemeColorModel(
        colorName: colorName ?? AppThemeColor.standard.name,
      );

      return Right(model);
    } catch (e) {
      const cacheFailure = CacheFailure(
        errorMessage: 'Could not get theme color.',
      );
      return const Left(cacheFailure);
    }
  }

  @override
  Future<Either<Failure, void>> setThemeColor(
    ChangeThemeColorParams params,
  ) async {
    try {
      await hiveBox.addData<String>(HiveBoxKeys.themeColor, params.color.name);
      return const Right(null);
    } catch (e) {
      const cacheFailure = CacheFailure(
        errorMessage: 'Could not set a new value for theme color.',
      );
      return const Left(cacheFailure);
    }
  }
}
