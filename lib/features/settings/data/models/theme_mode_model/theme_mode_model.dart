import 'package:chat_app/features/settings/domain/entities/theme_mode_entity/theme_mode_entity.dart';
import 'package:chat_app/utils/enum_parsing/enum_parsing_extension.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_mode_model.freezed.dart';

@freezed
class ThemeModeModel with _$ThemeModeModel {
  const factory ThemeModeModel({
    @Default('') String modeName,
  }) = _ThemeModeModel;

  const ThemeModeModel._();

  ThemeModeEntity toEntity() {
    return ThemeModeEntity(
      mode: Brightness.values.valueFromString(modeName) ?? Brightness.light,
    );
  }
}
