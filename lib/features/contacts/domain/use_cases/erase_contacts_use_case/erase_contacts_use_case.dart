import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/contacts_feature.dart';
import 'package:dartz/dartz.dart';

/// A use case for erasing all saved contacts.
///
/// This use case encapsulates the logic required to delete all contacts from the
/// repository. It uses the provided [ContactsRepository] to perform the deletion.
class EraseContactsUseCase implements UseCase<void, NoParams> {
  /// Creates an instance of [EraseContactsUseCase].
  ///
  /// Parameters:
  ///   [repository] The repository used to delete the contacts.
  const EraseContactsUseCase({
    required this.repository,
  });

  /// The repository used to delete the contacts.
  final ContactsRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.deleteSavedContacts();
  }
}
