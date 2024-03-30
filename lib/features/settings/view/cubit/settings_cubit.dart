import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/settings/domain/entities/theme_mode_entity/theme_mode_entity.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_color.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_mode.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_using_system_mode.dart';
import 'package:chat_app/features/settings/domain/use_cases/get_theme_color.dart';
import 'package:chat_app/features/settings/domain/use_cases/get_theme_mode.dart';
import 'package:chat_app/features/settings/domain/use_cases/get_using_system_mode.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  /// fd
  SettingsCubit({
    required this.changeThemeColor,
    required this.changeThemeMode,
    required this.changeUsingSystemMode,
    required this.getThemeColor,
    required this.getThemeMode,
    required this.getUsingSystemMode,
  }) : super(const SettingsState()) {
    _init();
  }

  SettingsState _state = const SettingsState();

  final ChangeThemeModeUseCase changeThemeMode;
  final GetThemeModeUseCase getThemeMode;

  final ChangeThemeColorUseCase changeThemeColor;
  final GetThemeColorUseCase getThemeColor;

  final ChangeUsingSystemModeUseCase changeUsingSystemMode;
  final GetUsingSystemModeUseCase getUsingSystemMode;

  Future<void> _init() async {
    await _initThemeMode();
    await _initThemeColor();
    getIt.signalReady(this);
  }

  Future<void> _initThemeMode() async {
    final Either<Failure, ThemeModeEntity> failureOrMode = await getThemeMode(
      NoParams(),
    );

    final Either<Failure, bool> failureOrBool = await getUsingSystemMode(
      NoParams(),
    );

    failureOrMode.fold(
      (failure) => null,
      (modeEntity) {
        _state = _state.copyWith(currentBrightness: modeEntity.mode);
      },
    );

    failureOrBool.fold(
      (failure) => null,
      (usingSystemMode) {
        _state = _state.copyWith(usingSystemBrightness: usingSystemMode);
      },
    );

    emit(_state);
  }

  Future<void> _initThemeColor() async {
    final failureOrEntity = await getThemeColor(NoParams());

    failureOrEntity.fold(
      // ignore: unnecessary_lambdas
      (failure) {
        print(failure);
      },
      (colorEntity) {
        _state = _state.copyWith(themeColor: colorEntity.color);
      },
    );
    emit(_state);
  }

  Future<void> switchUsingSystemMode() async {
    final bool newUsingSystemBrightness = !_state.usingSystemBrightness;

    final failureOrVoid = await changeUsingSystemMode(
      ChangeUsingSystemModeParams(
        usingSystemMode: newUsingSystemBrightness,
      ),
    );

    failureOrVoid.fold(
      // ignore: unnecessary_lambdas
      (failure) {
        print(failure);
      },
      (_) {
        _state = _state.copyWith(
          usingSystemBrightness: newUsingSystemBrightness,
        );
      },
    );
    emit(_state);
  }

  Future<void> switchThemeMode() async {
    final Brightness newBrightness = _state.currentBrightness == Brightness.dark
        ? Brightness.light
        : Brightness.dark;

    final failureOrVoid = await changeThemeMode(
      ChangeThemeModeParams(mode: newBrightness),
    );

    failureOrVoid.fold(
      // ignore: unnecessary_lambdas
      (failure) {
        print(failure);
      },
      (_) {
        _state = _state.copyWith(currentBrightness: newBrightness);
      },
    );

    emit(_state);
  }

  Future<void> setThemeColor(AppThemeColor themeColor) async {
    if (themeColor == _state.themeColor) return;

    final failureOrVoid = await changeThemeColor(
      ChangeThemeColorParams(color: themeColor),
    );

    failureOrVoid.fold(
      // ignore: unnecessary_lambdas
      (failure) {
        print(failure);
      },
      (_) {
        _state = _state.copyWith(themeColor: themeColor);
      },
    );

    emit(_state);
  }
}
