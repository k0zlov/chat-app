import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';

part 'contact_model.g.dart';

@freezed
class ContactModel with _$ContactModel {
  const factory ContactModel({
    @JsonKey(name: 'contactUserId') @Default(-1) int externalId,
    @Default('') String name,
    @Default('') String email,
    @Default('') String addedAt,
  }) = _ContactModel;

  const ContactModel._();

  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  ContactEntity toEntity() {
    return ContactEntity(
      id: externalId,
      name: name,
      email: email,
      addedAt: DateTime.tryParse(addedAt),
    );
  }
}
