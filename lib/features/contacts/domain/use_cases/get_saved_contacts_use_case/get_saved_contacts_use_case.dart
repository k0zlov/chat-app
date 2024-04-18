import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/contacts_feature.dart';
import 'package:chat_app/features/contacts/domain/entities/contacts_response_entity/contacts_response_entity.dart';
import 'package:dartz/dartz.dart';

class GetSavedContactsUseCase
    implements UseCase<ContactsResponseEntity, NoParams> {
  const GetSavedContactsUseCase({
    required this.repository,
  });

  final ContactsRepository repository;

  @override
  Future<Either<Failure, ContactsResponseEntity>> call(NoParams params) {
    return repository.getSavedContacts();
  }
}
