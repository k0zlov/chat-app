import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_entity.freezed.dart';

/// Represents a user entity with user details.
///
/// This class is generated using Freezed for immutable data structures.
@freezed
class UserEntity with _$UserEntity {
  /// Constructs an instance of [UserEntity] with the given user details.
  ///
  /// Parameters:
  ///   [id] The unique identifier of the user.
  ///   [name] The name of the user.
  ///   [email] The email address of the user.
  ///   [isActivated] The activation status of the user.
  ///   [createdAt] The date and time when the user was created.
  const factory UserEntity({
    @Default(-1) int id,
    @Default('') String name,
    @Default('') String bio,
    @Default('') String email,
    @Default(false) bool isActivated,
    @Default(null) DateTime? createdAt,
  }) = _UserEntity;

  const UserEntity._();
}
