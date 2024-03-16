import 'package:chat_app/features/auth/domain/entities/token_entity/token_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';

part 'token_model.g.dart';

@freezed
class TokenResponseModel with _$TokenResponseModel {
  const factory TokenResponseModel({
    @Default('') String accessToken,
    @Default('') String refreshToken,
  }) = _TokenResponseModel;

  const TokenResponseModel._();

  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);

  TokenResponseEntity toEntity() => TokenResponseEntity(
        accessToken: accessToken,
        refreshToken: refreshToken,
      );
}
