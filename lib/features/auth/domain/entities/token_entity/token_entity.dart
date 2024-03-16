import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_entity.freezed.dart';

@freezed
class TokenResponseEntity with _$TokenResponseEntity {
  const factory TokenResponseEntity({
    @Default('') String accessToken,
    @Default('') String refreshToken,
  }) = _TokenResponseEntity;

  const TokenResponseEntity._();
}