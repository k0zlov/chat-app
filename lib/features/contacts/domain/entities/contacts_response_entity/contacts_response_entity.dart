import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts_response_entity.freezed.dart';

/// A domain entity representing a response containing a list of contacts.
///
/// This class encapsulates the response from a contacts-related API call,
/// containing a list of [ContactEntity] instances. It is used in the domain layer
/// to ensure consistent handling of contact responses throughout the application.
@freezed
class ContactsResponseEntity with _$ContactsResponseEntity {
  /// Creates a new [ContactsResponseEntity].
  ///
  /// This constructor is used by the Freezed package to generate the necessary code for
  /// immutability and serialization. The `contacts` field is initialized with a default
  /// empty list or the provided list.
  ///
  /// Parameters:
  ///   [contacts] The list of contacts in the response, defaults to an empty list.
  const factory ContactsResponseEntity({
    @Default([]) List<ContactEntity> contacts,
  }) = _ContactsResponseEntity;

  /// Private constructor for [ContactsResponseEntity].
  ///
  /// This constructor is required by the Freezed package for creating private instances
  /// of the class.
  const ContactsResponseEntity._();
}
