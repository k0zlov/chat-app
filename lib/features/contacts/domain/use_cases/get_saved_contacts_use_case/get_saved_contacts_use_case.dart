import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/contacts_feature.dart';
import 'package:chat_app/features/contacts/domain/entities/contacts_response_entity/contacts_response_entity.dart';
import 'package:dartz/dartz.dart';

/// A use case for retrieving saved contacts.
///
/// This use case encapsulates the logic required to retrieve contacts from the
/// local repository. It uses the provided [ContactsRepository] to perform the
/// retrieval operation.
class GetSavedContactsUseCase implements UseCase<ContactsResponseEntity, NoParams> {
  /// Creates an instance of [GetSavedContactsUseCase].
  ///
  /// Parameters:
  ///   [repository] The repository used to retrieve the contacts.
  const GetSavedContactsUseCase({
    required this.repository,
  });

  /// The repository used to retrieve the contacts.
  final ContactsRepository repository;

  @override
  Future<Either<Failure, ContactsResponseEntity>> call(NoParams params) {
    return repository.getSavedContacts();
  }
}
