import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_mode_entity.freezed.dart';

@freezed
class ThemeModeEntity with _$ThemeModeEntity {
  const factory ThemeModeEntity({
    @Default(Brightness.light) Brightness mode,
  }) = _ThemeModeEntity;

  const ThemeModeEntity._();
}
