import 'package:freezed_annotation/freezed_annotation.dart';

part 'contact_entity.freezed.dart';

/// A domain entity representing a contact.
///
/// This class represents the core data structure for a contact within the application.
/// It is used in the domain layer to encapsulate contact information and ensure
/// consistency across different parts of the application.
@freezed
class ContactEntity with _$ContactEntity {
  /// Creates a new [ContactEntity].
  ///
  /// This constructor is used by the Freezed package to generate the necessary code for
  /// immutability and serialization. The fields are initialized with default values or
  /// the provided values.
  ///
  /// Parameters:
  ///   [id] The unique identifier of the contact, defaults to -1.
  ///   [name] The name of the contact, defaults to an empty string.
  ///   [email] The email of the contact, defaults to an empty string.
  ///   [addedAt] The date and time when the contact was added, defaults to null.
  ///   [lastActivityAt] The date and time when the contact had last activity at, defaults to null.
  const factory ContactEntity({
    @Default(-1) int id,
    @Default('') String name,
    @Default('') String email,
    @Default(null) DateTime? addedAt,
    @Default(null) DateTime? lastActivityAt,
  }) = _ContactEntity;

  /// Private constructor for [ContactEntity].
  ///
  /// This constructor is required by the Freezed package for creating private instances
  /// of the class.
  const ContactEntity._();
}
