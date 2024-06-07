import 'package:chat_app/features/contacts/data/models/contact_model/contact_model.dart';
import 'package:chat_app/features/contacts/domain/entities/contacts_response_entity/contacts_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contacts_response_model.freezed.dart';
part 'contacts_response_model.g.dart';

/// A data model for a response containing a list of contacts.
///
/// This class represents a response from an API that includes a list of contacts.
/// It uses the Freezed package to generate immutable data classes and serialization code.
@freezed
class ContactsResponseModel with _$ContactsResponseModel {
  /// Creates a new [ContactsResponseModel].
  ///
  /// This constructor is used by the Freezed package to generate the necessary code for
  /// immutability and serialization. The `contacts` field is initialized with a default
  /// empty list or the provided list.
  ///
  /// Parameters:
  ///   [contacts] The list of contacts in the response, defaults to an empty list.
  const factory ContactsResponseModel({
    @JsonKey(name: 'items') @Default([]) List<ContactModel> contacts,
  }) = _ContactsResponseModel;

  /// Private constructor for [ContactsResponseModel].
  ///
  /// This constructor is required by the Freezed package for creating private instances
  /// of the class.
  const ContactsResponseModel._();

  /// Creates a new [ContactsResponseModel] from a JSON object.
  ///
  /// This factory method is used to deserialize a JSON object into a [ContactsResponseModel]
  /// instance.
  ///
  /// Parameters:
  ///   [json] The JSON object to deserialize.
  ///
  /// Returns:
  ///   A new instance of [ContactsResponseModel] with the data from the JSON object.
  factory ContactsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponseModelFromJson(json);

  /// Converts this [ContactsResponseModel] to a [ContactsResponseEntity].
  ///
  /// This method transforms the [ContactsResponseModel] into a domain entity [ContactsResponseEntity]
  /// for use in the domain layer of the application.
  ///
  /// Returns:
  ///   A [ContactsResponseEntity] instance with the data from this [ContactsResponseModel].
  ContactsResponseEntity toEntity() {
    return ContactsResponseEntity(
      contacts: [...contacts.map((contact) => contact.toEntity())],
    );
  }
}
