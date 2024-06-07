import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/contacts_feature.dart';
import 'package:dartz/dartz.dart';

class EraseContactsUseCase implements UseCase<void, NoParams> {
  const EraseContactsUseCase({
    required this.repository,
  });

  final ContactsRepository repository;

  @override
  Future<Either<Failure, void>> call(NoParams params) {
    return repository.deleteSavedContacts();
  }
}
