import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';

part 'user_model.g.dart';

/// Data class representing a response containing a list of users.
///
/// This class is used to deserialize JSON responses into a list of [UserModel]
/// instances under the 'items' key.
@freezed
class UserResponse with _$UserResponse {
  /// Default constructor for creating a [UserResponse] instance.
  ///
  /// The `users` parameter specifies the list of [UserModel] instances.
  const factory UserResponse({
    @JsonKey(name: 'items') @Default([]) List<UserModel> users,
  }) = _UserResponse;
  const UserResponse._();

  /// Factory constructor for creating a [UserResponse] instance from JSON.
  ///
  /// The [json] parameter specifies the JSON data to deserialize.
  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
}

/// Data class representing a user.
///
/// This class is used to deserialize JSON representations of a user.
@freezed
class UserModel with _$UserModel {

  /// Default constructor for creating a [UserModel] instance.
  ///
  /// The `userid` parameter specifies the user's ID.
  const factory UserModel({
    @Default(0) int userid,
  }) = _UserModel;
  const UserModel._();

  /// Factory constructor for creating a [UserModel] instance from JSON.
  ///
  /// The [json] parameter specifies the JSON data to deserialize.
  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
