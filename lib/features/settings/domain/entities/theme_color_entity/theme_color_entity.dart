import 'package:chat_app/core/resources/theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_color_entity.freezed.dart';

@freezed
class ThemeColorEntity with _$ThemeColorEntity {
  const factory ThemeColorEntity({
    @Default(AppThemeColor.standart) AppThemeColor color,
  }) = _ThemeColorEntity;

  const ThemeColorEntity._();
}
