import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_entity.freezed.dart';

@freezed
class TokenEntity with _$TokenEntity {
  const factory TokenEntity({
    @Default('') String token,
  }) = _TokenEntity;

  const TokenEntity._();
}