import 'package:chat_app/features/contacts/data/models/contact_model/contact_model.dart';
import 'package:chat_app/features/contacts/domain/entities/contacts_response_entity/contacts_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts_response_model.freezed.dart';

part 'contacts_response_model.g.dart';

@freezed
class ContactsResponseModel with _$ContactsResponseModel {
  const factory ContactsResponseModel({
    @JsonKey(name: 'items') @Default([]) List<ContactModel> contacts,
  }) = _ContactsResponseModel;

  const ContactsResponseModel._();

  factory ContactsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseModelFromJson(json);

  ContactsResponseEntity toEntity() {
    return ContactsResponseEntity(
      contacts: [...contacts.map((contact) => contact.toEntity())],
    );
  }
}
