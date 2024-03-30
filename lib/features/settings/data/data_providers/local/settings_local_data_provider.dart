import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/settings/data/models/theme_mode_model/theme_mode_model.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_mode.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_using_system_mode.dart';
import 'package:chat_app/utils/hive/hive_box.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';

abstract class SettingsLocalDataProvider {
  Future<Either<Failure, ThemeModeModel>> getThemeMode();

  Future<Either<Failure, void>> setThemeMode(ChangeThemeModeParams params);

  Future<Either<Failure, bool>> getUsingSystemMode();

  Future<Either<Failure, void>> setUsingSystemMode(
    ChangeUsingSystemModeParams params,
  );
}

class SettingsLocalDataProviderImpl implements SettingsLocalDataProvider {
  const SettingsLocalDataProviderImpl({required this.hiveBox});

  final HiveBox hiveBox;

  @override
  Future<Either<Failure, ThemeModeModel>> getThemeMode() async {
    try {
      final String? modeName = hiveBox.getData<String?>(
        HiveBoxKeys.themeMode,
      );

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
      ChangeThemeModeParams params) async {
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
      final bool? usingSystemBrightness = hiveBox.getData<bool?>(
        HiveBoxKeys.isUsingSystemBrightness,
      );

      return Right(usingSystemBrightness ?? false);
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
}
