import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'remove_contact_use_case.freezed.dart';

part 'remove_contact_use_case.g.dart';

class RemoveContactUseCase implements UseCase<void, RemoveContactParams> {
  const RemoveContactUseCase({required this.repository});

  final ContactsRepository repository;

  @override
  Future<Either<Failure, void>> call(RemoveContactParams params) {
    return repository.removeContact(params);
  }
}

@freezed
class RemoveContactParams with _$RemoveContactParams {
  const factory RemoveContactParams({
    @Default(-1) int contactUserId,
  }) = _RemoveContactParams;

  const RemoveContactParams._();

  factory RemoveContactParams.fromJson(Map<String, dynamic> json) =>
      _$RemoveContactParamsFromJson(json);
}
