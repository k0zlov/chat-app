import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_contact_use_case.freezed.dart';
part 'add_contact_use_case.g.dart';

/// A use case for adding a contact.
///
/// This use case encapsulates the logic required to add a contact to the
/// repository. It uses the provided [ContactsRepository] to perform the
/// addition of a contact with the given parameters.
class AddContactUseCase implements UseCase<ContactEntity, AddContactParams> {
  /// Creates an instance of [AddContactUseCase].
  ///
  /// Parameters:
  ///   [repository] The repository used to add the contact.
  const AddContactUseCase({required this.repository});

  /// The repository used to add the contact.
  final ContactsRepository repository;

  @override
  Future<Either<Failure, ContactEntity>> call(AddContactParams params) {
    return repository.addContact(params);
  }
}

/// Parameters for the [AddContactUseCase].
///
/// This class defines the parameters required to add a contact,
/// including the contact's email. It uses the Freezed package to
/// generate immutable data classes and serialization code.
@freezed
class AddContactParams with _$AddContactParams {
  /// Creates an instance of [AddContactParams].
  ///
  /// Parameters:
  ///   [contactUserEmail] The email of the contact to be added, defaults to an empty string.
  const factory AddContactParams({
    @Default('') String contactUserEmail,
  }) = _AddContactParams;

  /// Private constructor for [AddContactParams].
  ///
  /// This constructor is required by the Freezed package for creating private instances
  /// of the class.
  const AddContactParams._();

  /// Creates a new [AddContactParams] from a JSON object.
  ///
  /// This factory method is used to deserialize a JSON object into an [AddContactParams]
  /// instance.
  ///
  /// Parameters:
  ///   [json] The JSON object to deserialize.
  ///
  /// Returns:
  ///   A new instance of [AddContactParams] with the data from the JSON object.
  factory AddContactParams.fromJson(Map<String, dynamic> json) =>
      _$AddContactParamsFromJson(json);
}
