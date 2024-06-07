import 'package:bloc/bloc.dart';
import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/core/widgets/modal_pop_up.dart';
import 'package:chat_app/features/contacts/contacts_feature.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/features/contacts/domain/use_cases/erase_contacts_use_case/erase_contacts_use_case.dart';
import 'package:chat_app/features/contacts/domain/use_cases/search_contacts_use_case/search_contacts_use_case.dart';
import 'package:chat_app/utils/text_input_validator/text_input_validator.dart';
import 'package:flutter/cupertino.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit({
    required this.addContactUseCase,
    required this.fetchContactsUseCase,
    required this.removeContactUseCase,
    required this.getSavedContactsUseCase,
    required this.searchContactsUseCase,
    required this.eraseContactsUseCase,
  }) : super(const ContactsState());

  ContactsState _state = const ContactsState();

  final AddContactUseCase addContactUseCase;
  final FetchContactsUseCase fetchContactsUseCase;
  final RemoveContactUseCase removeContactUseCase;
  final GetSavedContactsUseCase getSavedContactsUseCase;
  final SearchContactsUseCase searchContactsUseCase;
  final EraseContactsUseCase eraseContactsUseCase;

  /// Shows an error message.
  void showError(String error) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (AppNavigation.rootNavigatorKey.currentContext == null) {
        return;
      }
      showCupertinoModalPopup<void>(
        context: AppNavigation.rootNavigatorKey.currentContext!,
        builder: (BuildContext context) {
          return ModalPopUpContainer(
            iconData: CupertinoIcons.exclamationmark_triangle_fill,
            message: error,
          );
        },
      );
    });
  }

  Future<void> _loadSavedContacts() async {
    _state = _state.copyWith(contactsLoading: true);
    emit(_state);

    final failureOrContacts = await getSavedContactsUseCase(NoParams());

    failureOrContacts.fold(
      (failure) => null,
      (entity) {
        _state = _state.copyWith(contacts: entity.contacts);
      },
    );
    _state = _state.copyWith(contactsLoading: false);
    emit(_state);
  }

  Future<void> fetchContacts() async {
    final failureOrContacts = await fetchContactsUseCase(NoParams());

    failureOrContacts.fold(
      (failure) => showError(failure.errorMessage),
      (entity) {
        _state = _state.copyWith(contacts: entity.contacts);
      },
    );
    _state = _state.copyWith(contactsLoading: false);
    emit(_state);
  }

  Future<void> addContact() async {
    final String email = _state.emailText;

    if (email.isEmpty || TextInputValidator.validateEmail(email) != null) {
      return;
    }

    _state = _state.copyWith(contactsLoading: true);
    emit(_state);

    final failureOrEntity = await addContactUseCase(
      AddContactParams(contactUserEmail: email),
    );

    failureOrEntity.fold(
      (failure) => showError(failure.errorMessage),
      (entity) {
        _state = _state.copyWith(
          contacts: [..._state.contacts, entity],
        );
      },
    );

    _state = _state.copyWith(contactsLoading: false);
    emit(_state);
  }

  Future<void> removeContact(ContactEntity entity) async {
    final response = await removeContactUseCase(
      RemoveContactParams(contactUserEmail: entity.email),
    );

    response.fold(
      (failure) => showError(failure.errorMessage),
      (_) {
        final List<ContactEntity> contacts = _state.contacts
            .where((contact) => contact.id != entity.id)
            .toList();

        _state = _state.copyWith(contacts: contacts);
        emit(_state);
      },
    );
  }

  void onSearchChanged(String text) {
    if (_state.searchText == text) return;

    _state = _state.copyWith(searchText: text);
    emit(_state);

    if (text != '') {
      getSearchContacts();
    } else {
      _state = _state.copyWith(searchedContacts: []);
      emit(_state);
    }
  }

  void onEmailChanged(String text) {
    if (_state.emailText == text) return;

    _state = _state.copyWith(emailText: text);
    emit(_state);
  }

  Future<void> getSearchContacts() async {
    final String searchText = _state.searchText;

    Future.delayed(const Duration(milliseconds: 300), () async {
      if (searchText != _state.searchText) return;

      _state = _state.copyWith(searchingContacts: true);
      emit(_state);

      final failureOrContacts = await searchContactsUseCase(
        SearchContactsParams(name: searchText),
      );

      failureOrContacts.fold(
        (failure) => showError(failure.errorMessage),
        (entity) {
          _state = _state.copyWith(searchedContacts: entity.contacts);
        },
      );

      _state = _state.copyWith(searchingContacts: false);
      emit(_state);
    });
  }

  Future<void> onLogin() async {
    await _loadSavedContacts();
    await fetchContacts();
  }

  Future<void> onLogout() async {
    await eraseContactsUseCase(NoParams());
  }
}
