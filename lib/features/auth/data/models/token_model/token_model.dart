import 'package:chat_app/features/auth/domain/entities/token_entity/token_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';

part 'token_model.g.dart';

@freezed
class TokenModel with _$TokenModel {
  const factory TokenModel({
    @JsonKey(name: 'accessToken') @Default('') String token,
  }) = _TokenModel;

  const TokenModel._();

  factory TokenModel.fromJson(Map<String, dynamic> json) =>
      _$TokenModelFromJson(json);

  TokenEntity toEntity() => TokenEntity(token: token);
}
