import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/domain/entities/contacts_response_entity/contacts_response_entity.dart';
import 'package:chat_app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';

/// A use case for fetching all contacts.
///
/// This use case encapsulates the logic required to fetch contacts from the
/// repository. It uses the provided [ContactsRepository] to perform the fetch
/// operation.
class FetchContactsUseCase implements UseCase<ContactsResponseEntity, NoParams> {
  /// Creates an instance of [FetchContactsUseCase].
  ///
  /// Parameters:
  ///   [repository] The repository used to fetch the contacts.
  const FetchContactsUseCase({required this.repository});

  /// The repository used to fetch the contacts.
  final ContactsRepository repository;

  @override
  Future<Either<Failure, ContactsResponseEntity>> call(NoParams params) {
    return repository.fetchContacts();
  }
}
