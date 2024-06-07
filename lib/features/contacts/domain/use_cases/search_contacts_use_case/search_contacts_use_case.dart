import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/contacts_feature.dart';
import 'package:chat_app/features/contacts/domain/entities/contacts_response_entity/contacts_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_contacts_use_case.freezed.dart';

part 'search_contacts_use_case.g.dart';

class SearchContactsUseCase
    implements UseCase<ContactsResponseEntity, SearchContactsParams> {
  const SearchContactsUseCase({
    required this.repository,
  });

  final ContactsRepository repository;

  @override
  Future<Either<Failure, ContactsResponseEntity>> call(
    SearchContactsParams params,
  ) {
    return repository.searchContacts(params);
  }
}

@freezed
class SearchContactsParams with _$SearchContactsParams {
  const factory SearchContactsParams({
    @Default('') String name,
  }) = _SearchContactsParams;

  const SearchContactsParams._();

  factory SearchContactsParams.fromJson(Map<String, dynamic> json) =>
      _$SearchContactsParamsFromJson(json);
}
