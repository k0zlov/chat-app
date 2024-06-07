import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/features/settings/domain/entities/theme_color_entity/theme_color_entity.dart';
import 'package:chat_app/utils/enum_parsing/enum_parsing_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_color_model.freezed.dart';

/// The [ThemeColorModel] class represents the data model for theme color.
/// This class uses the `freezed` package to generate immutable value objects.
@freezed
class ThemeColorModel with _$ThemeColorModel {
  /// Creates a [ThemeColorModel] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `colorName`: The name of the color, default is 'standard'.
  const factory ThemeColorModel({
    @Default('standard') String colorName,
  }) = _ThemeColorModel;

  /// Private constructor for [ThemeColorModel].
  /// This is used by the `freezed` package to generate the implementation.
  const ThemeColorModel._();

  /// Converts the [ThemeColorModel] instance to a [ThemeColorEntity].
  ///
  /// This method transforms the data model to a domain entity, which is used
  /// in the application's business logic. It also handles the parsing of
  /// the `colorName` field into an [AppThemeColor] enum, defaulting to [AppThemeColor.standard] if parsing fails.
  ThemeColorEntity toEntity() {
    final AppThemeColor? colorFromRaw = AppThemeColor.values.valueFromString(
      colorName,
    );
    return ThemeColorEntity(
      color: colorFromRaw ?? AppThemeColor.standard,
    );
  }
}
