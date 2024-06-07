import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/contacts_feature.dart';
import 'package:chat_app/features/contacts/domain/entities/contacts_response_entity/contacts_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_contacts_use_case.freezed.dart';
part 'search_contacts_use_case.g.dart';

/// A use case for searching contacts.
///
/// This use case encapsulates the logic required to search for contacts in the
/// repository. It uses the provided [ContactsRepository] to perform the search
/// operation with the given parameters.
class SearchContactsUseCase
    implements UseCase<ContactsResponseEntity, SearchContactsParams> {
  /// Creates an instance of [SearchContactsUseCase].
  ///
  /// Parameters:
  ///   [repository] The repository used to search for contacts.
  const SearchContactsUseCase({
    required this.repository,
  });

  /// The repository used to search for contacts.
  final ContactsRepository repository;

  @override
  Future<Either<Failure, ContactsResponseEntity>> call(
      SearchContactsParams params,
      ) {
    return repository.searchContacts(params);
  }
}

/// Parameters for the [SearchContactsUseCase].
///
/// This class defines the parameters required to search for contacts,
/// including the name of the contact to search for. It uses the Freezed package to
/// generate immutable data classes and serialization code.
@freezed
class SearchContactsParams with _$SearchContactsParams {
  /// Creates an instance of [SearchContactsParams].
  ///
  /// Parameters:
  ///   [username] The name of the contact to search for, defaults to an empty string.
  const factory SearchContactsParams({
    @Default('') String username,
  }) = _SearchContactsParams;

  /// Private constructor for [SearchContactsParams].
  ///
  /// This constructor is required by the Freezed package for creating private instances
  /// of the class.
  const SearchContactsParams._();

  /// Creates a new [SearchContactsParams] from a JSON object.
  ///
  /// This factory method is used to deserialize a JSON object into a [SearchContactsParams]
  /// instance.
  ///
  /// Parameters:
  ///   [json] The JSON object to deserialize.
  ///
  /// Returns:
  ///   A new instance of [SearchContactsParams] with the data from the JSON object.
  factory SearchContactsParams.fromJson(Map<String, dynamic> json) =>
      _$SearchContactsParamsFromJson(json);
}
