import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_contact_use_case.freezed.dart';
part 'remove_contact_use_case.g.dart';

/// A use case for removing a contact.
///
/// This use case encapsulates the logic required to remove a contact from the
/// repository. It uses the provided [ContactsRepository] to perform the
/// removal operation.
class RemoveContactUseCase implements UseCase<void, RemoveContactParams> {
  /// Creates an instance of [RemoveContactUseCase].
  ///
  /// Parameters:
  ///   [repository] The repository used to remove the contact.
  const RemoveContactUseCase({required this.repository});

  /// The repository used to remove the contact.
  final ContactsRepository repository;

  @override
  Future<Either<Failure, void>> call(RemoveContactParams params) {
    return repository.removeContact(params);
  }
}

/// Parameters for the [RemoveContactUseCase].
///
/// This class defines the parameters required to remove a contact,
/// including the contact's email. It uses the Freezed package to
/// generate immutable data classes and serialization code.
@freezed
class RemoveContactParams with _$RemoveContactParams {
  /// Creates an instance of [RemoveContactParams].
  ///
  /// Parameters:
  ///   [contactUserEmail] The email of the contact to be removed, defaults to an empty string.
  const factory RemoveContactParams({
    @Default('') String contactUserEmail,
  }) = _RemoveContactParams;

  /// Private constructor for [RemoveContactParams].
  ///
  /// This constructor is required by the Freezed package for creating private instances
  /// of the class.
  const RemoveContactParams._();

  /// Creates a new [RemoveContactParams] from a JSON object.
  ///
  /// This factory method is used to deserialize a JSON object into a [RemoveContactParams]
  /// instance.
  ///
  /// Parameters:
  ///   [json] The JSON object to deserialize.
  ///
  /// Returns:
  ///   A new instance of [RemoveContactParams] with the data from the JSON object.
  factory RemoveContactParams.fromJson(Map<String, dynamic> json) =>
      _$RemoveContactParamsFromJson(json);
}
