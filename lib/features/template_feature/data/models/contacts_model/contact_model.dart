import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';

part 'contact_model.g.dart';

/// Represents a response containing a list of message models.
@freezed
class ContactResponse with _$ContactResponse {
  /// Default constructor for [ContactResponse].
  const factory ContactResponse({
    @JsonKey(name: 'items') @Default([]) List<ContactModel> contacts,
  }) = _ContactResponse;

  const ContactResponse._();

  /// Creates a [ContactResponse] instance from JSON data.
  factory ContactResponse.fromJson(Map<String, dynamic> json) =>
      _$ContactResponseFromJson(json);
}

/// Represents a message model.
@freezed
class ContactModel with _$ContactModel {
  /// Default constructor for [ContactModel].
  const factory ContactModel({
    @Default(0) int userid,
    @JsonKey(name: 'addedat') @Default('') String addedAt,
    @JsonKey(name: 'contactuserid') @Default(0) int contactUserid,
  }) = _ContactModel;

  const ContactModel._();

  /// Creates a [ContactModel] instance from JSON data.
  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);
}
