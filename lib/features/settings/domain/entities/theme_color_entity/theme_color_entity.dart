import 'package:chat_app/core/resources/theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_color_entity.freezed.dart';

/// The [ThemeColorEntity] class represents the domain entity for theme color.
/// This class uses the `freezed` package to generate immutable value objects.
@freezed
class ThemeColorEntity with _$ThemeColorEntity {
  /// Creates a [ThemeColorEntity] instance.
  ///
  /// The factory constructor provides a default value for the `color` field.
  ///
  /// - `color`: The theme color, default is [AppThemeColor.standard].
  const factory ThemeColorEntity({
    @Default(AppThemeColor.standard) AppThemeColor color,
  }) = _ThemeColorEntity;

  /// Private constructor for [ThemeColorEntity].
  /// This is used by the `freezed` package to generate the implementation.
  const ThemeColorEntity._();
}
