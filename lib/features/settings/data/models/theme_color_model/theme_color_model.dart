import 'package:chat_app/core/resources/theme.dart';
import 'package:chat_app/features/settings/domain/entities/theme_color_entity/theme_color_entity.dart';
import 'package:chat_app/utils/enum_parsing/enum_parsing_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_color_model.freezed.dart';

@freezed
class ThemeColorModel with _$ThemeColorModel {
  const factory ThemeColorModel({
    @Default('standard') String colorName,
  }) = _ThemeColorModel;

  const ThemeColorModel._();

  ThemeColorEntity toEntity() {
    final AppThemeColor? colorFromRaw = AppThemeColor.values.valueFromString(
      colorName,
    );
    return ThemeColorEntity(
      color: colorFromRaw ?? AppThemeColor.standard,
    );
  }
}
