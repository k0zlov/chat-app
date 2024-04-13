import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'add_contact_use_case.freezed.dart';

part 'add_contact_use_case.g.dart';

class AddContactUseCase implements UseCase<ContactEntity, AddContactParams> {
  const AddContactUseCase({required this.repository});

  final ContactsRepository repository;

  @override
  Future<Either<Failure, ContactEntity>> call(AddContactParams params) {
    return repository.addContact(params);
  }
}

@freezed
class AddContactParams with _$AddContactParams {
  const factory AddContactParams({
    @Default('') String contactUserEmail,
  }) = _AddContactParams;

  const AddContactParams._();

  factory AddContactParams.fromJson(Map<String, dynamic> json) =>
      _$AddContactParamsFromJson(json);
}
