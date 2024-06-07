import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_model.freezed.dart';
part 'contact_model.g.dart';

/// A data model for contact information.
///
/// This class represents a contact in the application, with fields for the contact's
/// external ID, name, email, and the date they were added. It uses the Freezed package
/// to generate immutable data classes and serialization code.
@freezed
class ContactModel with _$ContactModel {
  /// Creates a new [ContactModel].
  ///
  /// This constructor is used by the Freezed package to generate the necessary code for
  /// immutability and serialization. The fields are initialized with default values or
  /// the provided values.
  ///
  /// Parameters:
  ///   [contactUserId] The external ID of the contact, defaults to -1.
  ///   [name] The name of the contact, defaults to an empty string.
  ///   [email] The email of the contact, defaults to an empty string.
  ///   [addedAt] The date when the contact was added, defaults to an empty string.
  const factory ContactModel({
    @Default(-1) int contactUserId,
    @Default('') String name,
    @Default('') String email,
    @Default('') String addedAt,
  }) = _ContactModel;

  /// Private constructor for [ContactModel].
  ///
  /// This constructor is required by the Freezed package for creating private instances
  /// of the class.
  const ContactModel._();

  /// Creates a new [ContactModel] from a JSON object.
  ///
  /// This factory method is used to deserialize a JSON object into a [ContactModel]
  /// instance.
  ///
  /// Parameters:
  ///   [json] The JSON object to deserialize.
  ///
  /// Returns:
  ///   A new instance of [ContactModel] with the data from the JSON object.
  factory ContactModel.fromJson(Map<String, dynamic> json) =>
      _$ContactModelFromJson(json);

  /// Converts this [ContactModel] to a [ContactEntity].
  ///
  /// This method transforms the [ContactModel] into a domain entity [ContactEntity]
  /// for use in the domain layer of the application.
  ///
  /// Returns:
  ///   A [ContactEntity] instance with the data from this [ContactModel].
  ContactEntity toEntity() {
    return ContactEntity(
      id: contactUserId,
      name: name,
      email: email,
      addedAt: DateTime.tryParse(addedAt),
    );
  }
}
