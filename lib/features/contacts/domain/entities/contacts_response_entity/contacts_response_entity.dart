import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts_response_entity.freezed.dart';

@freezed
class ContactsResponseEntity with _$ContactsResponseEntity {
  const factory ContactsResponseEntity({
    @Default([]) List<ContactEntity> contacts,
  }) = _ContactsResponseEntity;

  const ContactsResponseEntity._();
}
