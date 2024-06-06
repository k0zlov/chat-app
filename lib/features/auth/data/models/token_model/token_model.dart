import 'package:chat_app/features/auth/domain/entities/token_entity/token_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_model.freezed.dart';
part 'token_model.g.dart';

/// Represents the data model for authentication tokens.
///
/// This class is generated using Freezed for immutable data structures.
@freezed
class TokenResponseModel with _$TokenResponseModel {
  /// Constructs an instance of [TokenResponseModel] with the given access and refresh tokens.
  ///
  /// Parameters:
  ///   [accessToken] The access token for the authenticated session.
  ///   [refreshToken] The refresh token for renewing the access token.
  const factory TokenResponseModel({
    @Default('') String accessToken,
    @Default('') String refreshToken,
  }) = _TokenResponseModel;

  const TokenResponseModel._();

  /// Creates an instance of [TokenResponseModel] from a JSON object.
  ///
  /// Parameters:
  ///   [json] A JSON object containing the token data.
  ///
  /// Returns:
  ///   An instance of [TokenResponseModel].
  factory TokenResponseModel.fromJson(Map<String, dynamic> json) =>
      _$TokenResponseModelFromJson(json);

  /// Converts this [TokenResponseModel] to a [TokenResponseEntity].
  ///
  /// Returns:
  ///   An instance of [TokenResponseEntity] containing the same token data.
  TokenResponseEntity toEntity() => TokenResponseEntity(
    accessToken: accessToken,
    refreshToken: refreshToken,
  );
}
