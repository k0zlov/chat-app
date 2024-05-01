import 'package:chat_app/core/widgets/screens/add_screen.dart';
import 'package:chat_app/features/contacts/view/cubit/contacts_cubit.dart';
import 'package:chat_app/utils/text_input_validator/text_input_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactsCubit cubit = context.read<ContactsCubit>();
    final ContactsState state = context.select(
          (ContactsCubit cubit) => cubit.state,
    );

    final bool validEmail = state.emailText.isNotEmpty &&
        TextInputValidator.validateEmail(state.emailText) == null;

    return AddScreen(
      title: 'Add Contact',
      inputName: 'Email',
      text: state.emailText,
      isValid: validEmail,
      onChanged: cubit.onEmailChanged,
      onSubmit: cubit.addContact,
    );
  }
}
