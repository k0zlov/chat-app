import 'package:bloc/bloc.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/contacts/contacts_feature.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/utils/text_input_validator/text_input_validator.dart';
import 'package:meta/meta.dart';

part 'contacts_state.dart';

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit({
    required this.addContactUseCase,
    required this.getAllContactsUseCase,
    required this.removeContactUseCase,
  }) : super(const ContactsState()) {
    _init();
  }

  ContactsState _state = const ContactsState();

  final AddContactUseCase addContactUseCase;
  final GetAllContactsUseCase getAllContactsUseCase;
  final RemoveContactUseCase removeContactUseCase;

  Future<void> _init() async {
    await loadAllContacts();
  }

  Future<void> loadAllContacts() async {
    _state = _state.copyWith(contactsLoading: true);
    emit(_state);

    final failureOrContacts = await getAllContactsUseCase(NoParams());

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
        await loadAllContacts();
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
