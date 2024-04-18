import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/domain/entities/contacts_response_entity/contacts_response_entity.dart';
import 'package:chat_app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';

class FetchContactsUseCase
    implements UseCase<ContactsResponseEntity, NoParams> {
  const FetchContactsUseCase({required this.repository});

  final ContactsRepository repository;

  @override
  Future<Either<Failure, ContactsResponseEntity>> call(NoParams params) {
    return repository.fetchContacts();
  }
}
