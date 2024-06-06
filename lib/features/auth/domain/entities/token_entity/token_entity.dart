import 'package:freezed_annotation/freezed_annotation.dart';

part 'token_entity.freezed.dart';

/// Represents the response entity containing authentication tokens.
///
/// This class is generated using Freezed for immutable data structures.
@freezed
class TokenResponseEntity with _$TokenResponseEntity {
  /// Constructs an instance of [TokenResponseEntity] with the given access and refresh tokens.
  ///
  /// Parameters:
  ///   [accessToken] The access token for the authenticated session.
  ///   [refreshToken] The refresh token for renewing the access token.
  const factory TokenResponseEntity({
    @Default('') String accessToken,
    @Default('') String refreshToken,
  }) = _TokenResponseEntity;

  const TokenResponseEntity._();
}
