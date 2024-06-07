import 'package:chat_app/features/settings/domain/entities/theme_mode_entity/theme_mode_entity.dart';
import 'package:chat_app/utils/enum_parsing/enum_parsing_extension.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_mode_model.freezed.dart';

/// The [ThemeModeModel] class represents the data model for theme mode.
/// This class uses the `freezed` package to generate immutable value objects.
@freezed
class ThemeModeModel with _$ThemeModeModel {
  /// Creates a [ThemeModeModel] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `modeName`: The name of the mode, default is an empty string.
  const factory ThemeModeModel({
    @Default('') String modeName,
  }) = _ThemeModeModel;

  /// Private constructor for [ThemeModeModel].
  /// This is used by the `freezed` package to generate the implementation.
  const ThemeModeModel._();

  /// Converts the [ThemeModeModel] instance to a [ThemeModeEntity].
  ///
  /// This method transforms the data model to a domain entity, which is used
  /// in the application's business logic. It also handles the parsing of
  /// the `modeName` field into a [Brightness] enum, defaulting to [Brightness.light] if parsing fails.
  ThemeModeEntity toEntity() {
    return ThemeModeEntity(
      mode: Brightness.values.valueFromString(modeName) ?? Brightness.light,
    );
  }
}
