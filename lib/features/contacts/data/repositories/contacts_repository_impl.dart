import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/features/contacts/data/providers/local/contacts_local_provider.dart';
import 'package:chat_app/features/contacts/data/providers/remote/contacts_remote_provider.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/features/contacts/domain/entities/contacts_response_entity/contacts_response_entity.dart';
import 'package:chat_app/features/contacts/domain/repositories/contacts_repository.dart';
import 'package:chat_app/features/contacts/domain/use_cases/add_contact_use_case/add_contact_use_case.dart';
import 'package:chat_app/features/contacts/domain/use_cases/remove_contact_use_case/remove_contact_use_case.dart';
import 'package:chat_app/features/contacts/domain/use_cases/search_contacts_use_case/search_contacts_use_case.dart';
import 'package:dartz/dartz.dart';

/// Implementation of [ContactsRepository] that interacts with remote and local providers.
///
/// This class provides concrete implementations for fetching, saving, adding, removing,
/// and searching contacts using both remote and local data sources. It ensures that
/// data is synchronized between the remote server and local storage.
class ContactsRepositoryImpl implements ContactsRepository {
  /// Creates an instance of [ContactsRepositoryImpl].
  ///
  /// Parameters:
  ///   [remoteProvider] The remote provider for network operations.
  ///   [localProvider] The local provider for local database operations.
  const ContactsRepositoryImpl({
    required this.remoteProvider,
    required this.localProvider,
  });

  /// The remote provider for network operations.
  final ContactsRemoteProvider remoteProvider;

  /// The local provider for local database operations.
  final ContactsLocalProvider localProvider;

  @override
  Future<Either<Failure, ContactsResponseEntity>> fetchContacts() async {
    final response = await remoteProvider.getAllContacts();

    return response.fold(
      (failure) async => getSavedContacts(),
      (model) async {
        await localProvider.rewriteSavedContacts(model.contacts);

        final ContactsResponseEntity entity = model.toEntity();
        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, ContactsResponseEntity>> getSavedContacts() async {
    final response = await localProvider.getSavedContacts();

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (model) {
        final ContactsResponseEntity entity = model.toEntity();
        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, ContactEntity>> addContact(
    AddContactParams params,
  ) async {
    final response = await remoteProvider.addContact(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (model) async {
        await localProvider.saveContact(model);
        final ContactEntity entity = model.toEntity();
        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, void>> removeContact(
    RemoveContactParams params,
  ) async {
    final response = await remoteProvider.removeContact(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (_) async {
        await localProvider.deleteContact(params);
        return const Right(null);
      },
    );
  }

  @override
  Future<Either<Failure, ContactsResponseEntity>> searchContacts(
    SearchContactsParams params,
  ) async {
    final response = await remoteProvider.searchContacts(params);

    return response.fold(
      // ignore: unnecessary_lambdas
      (failure) => Left(failure),
      (model) {
        final ContactsResponseEntity entity = model.toEntity();

        return Right(entity);
      },
    );
  }

  @override
  Future<Either<Failure, void>> deleteSavedContacts() {
    return localProvider.deleteAllContacts();
  }
}
