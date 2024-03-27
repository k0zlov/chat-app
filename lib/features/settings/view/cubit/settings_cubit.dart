import 'dart:ui';

import 'package:bloc/bloc.dart';
import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/settings/domain/entities/theme_color_entity/theme_color_entity.dart';
import 'package:chat_app/features/settings/domain/entities/theme_mode_entity/theme_mode_entity.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_color.dart';
import 'package:chat_app/features/settings/domain/use_cases/change_theme_mode.dart';
import 'package:chat_app/features/settings/domain/use_cases/get_theme_color.dart';
import 'package:chat_app/features/settings/domain/use_cases/get_theme_mode.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/cupertino.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  /// fd
  SettingsCubit({
    required this.changeThemeColor,
    required this.changeThemeMode,
    required this.getThemeColor,
    required this.getThemeMode,
  }) : super(const SettingsState()) {
    _init();
  }

  SettingsState _state = const SettingsState();

  final ChangeThemeModeUseCase changeThemeMode;
  final GetThemeModeUseCase getThemeMode;

  final ChangeThemeColorUseCase changeThemeColor;
  final GetThemeColorUseCase getThemeColor;

  Future<void> _init() async {
    await _initThemeMode();
    await _initThemeColor();
    getIt.signalReady(this);
  }

  Future<void> _initThemeMode() async {
    final Either<Failure, ThemeModeEntity> failureOrMode =
        await getThemeMode(NoParams());

    failureOrMode.fold(
      (failure) => null,
      (modeEntity) {
        _state = _state.copyWith(themeMode: modeEntity.mode);
        emit(_state);
      },
    );
  }

  Future<void> _initThemeColor() async {
    final Either<Failure, ThemeColorEntity> failureOrColor =
        await getThemeColor(NoParams());

    failureOrColor.fold(
      (failure) => null,
      (colorEntity) {
        _state = _state.copyWith(themeColor: colorEntity.color);
        emit(_state);
      },
    );
  }
}
