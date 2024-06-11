import 'package:chat_app/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

/// Represents the data model for a user.
///
/// This class is generated using Freezed for immutable data structures.
@freezed
class UserModel with _$UserModel {
  /// Constructs an instance of [UserModel] with the given user details.
  ///
  /// Parameters:
  ///   [externalId] The unique identifier of the user.
  ///   [name] The name of the user.
  ///   [email] The email address of the user.
  ///   [isActivated] The activation status of the user.
  ///   [createdAt] The date and time when the user was created as a string.
  const factory UserModel({
    @JsonKey(name: 'id') @Default(-1) int externalId,
    @Default('') String name,
    @Default('') String bio,
    @Default('') String email,
    @Default(false) bool isActivated,
    @Default('') String createdAt,
  }) = _UserModel;

  const UserModel._();

  /// Creates an instance of [UserModel] from a JSON object.
  ///
  /// Parameters:
  ///   [json] A JSON object containing the user data.
  ///
  /// Returns:
  ///   An instance of [UserModel].
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  /// Converts this [UserModel] to a [UserEntity].
  ///
  /// Returns:
  ///   An instance of [UserEntity] containing the same user data.
  UserEntity toEntity() => UserEntity(
    id: externalId,
    name: name,
    bio: bio,
    email: email,
    isActivated: isActivated,
    createdAt: DateTime.tryParse(createdAt),
  );
}
