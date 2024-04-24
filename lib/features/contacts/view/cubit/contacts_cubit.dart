import 'package:bloc/bloc.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/contacts/contacts_feature.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/features/contacts/domain/use_cases/get_saved_contacts_use_case/get_saved_contacts_use_case.dart';
import 'package:chat_app/utils/text_input_validator/text_input_validator.dart';
import 'package:meta/meta.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit({
    required this.addContactUseCase,
    required this.fetchContactsUseCase,
    required this.removeContactUseCase,
    required this.getSavedContactsUseCase,
  }) : super(const ContactsState()) {
    _init();
  }

  ContactsState _state = const ContactsState();

  final AddContactUseCase addContactUseCase;
  final FetchContactsUseCase fetchContactsUseCase;
  final RemoveContactUseCase removeContactUseCase;
  final GetSavedContactsUseCase getSavedContactsUseCase;

  Future<void> _init() async {
    await _loadSavedContacts();
    getIt.signalReady(this);
    await fetchContacts();
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
      (failure) => null,
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

    final failureOrSuccess = await addContactUseCase(
      AddContactParams(contactUserEmail: email),
    );

    await failureOrSuccess.fold(
      (failure) => null,
      (_) async {
        await fetchContacts();
      },
    );

    if (_state.contactsLoading) {
      _state = _state.copyWith(contactsLoading: false);
      emit(_state);
    }
  }

  Future<void> removeContact(ContactEntity entity) async {
    final response = await removeContactUseCase(
      RemoveContactParams(contactUserId: entity.id),
    );

    response.fold(
      (failure) => null,
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
  }

  void onEmailChanged(String text) {
    if (_state.emailText == text) return;

    _state = _state.copyWith(emailText: text);
    emit(_state);
  }
}
