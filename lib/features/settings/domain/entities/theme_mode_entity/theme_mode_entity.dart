import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_mode_entity.freezed.dart';

/// The [ThemeModeEntity] class represents the domain entity for theme mode.
/// This class uses the `freezed` package to generate immutable value objects.
@freezed
class ThemeModeEntity with _$ThemeModeEntity {
  /// Creates a [ThemeModeEntity] instance.
  ///
  /// The factory constructor provides a default value for the `mode` field.
  ///
  /// - `mode`: The theme mode, default is [Brightness.light].
  const factory ThemeModeEntity({
    @Default(Brightness.light) Brightness mode,
  }) = _ThemeModeEntity;

  /// Private constructor for [ThemeModeEntity].
  /// This is used by the `freezed` package to generate the implementation.
  const ThemeModeEntity._();
}
