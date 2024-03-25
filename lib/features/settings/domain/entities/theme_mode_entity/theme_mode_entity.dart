import 'package:chat_app/core/resources/theme.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'theme_mode_entity.freezed.dart';

@freezed
class ThemeModeEntity with _$ThemeModeEntity {
  const factory ThemeModeEntity({
    @Default(AppThemeMode.system) AppThemeMode mode,
  }) = _ThemeModeEntity;

  const ThemeModeEntity._();
}
