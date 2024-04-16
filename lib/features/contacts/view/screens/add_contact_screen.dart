import 'package:chat_app/core/widgets/buttons/text_input_clear_button.dart';
import 'package:chat_app/core/widgets/reactive_text_field.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/contacts/view/cubit/contacts_cubit.dart';
import 'package:chat_app/utils/text_input_validator/text_input_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class AddContactScreen extends StatelessWidget {
  const AddContactScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final Color borderColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.systemGrey
            : CupertinoColors.inactiveGray;

    return BlocProvider.value(
      value: getIt<ContactsCubit>(),
      child: Container(
        margin: const EdgeInsets.only(top: 120),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: CupertinoTheme.of(context).scaffoldBackgroundColor,
          border: Border(
            top: BorderSide(color: borderColor, width: 0.2),
          ),
        ),
        child: const Column(
          children: [
            _AddContactScreenHeader(),
            Expanded(child: _AddContactScreenBody()),
          ],
        ),
      ),
    );
  }
}

class _AddContactScreenBody extends StatelessWidget {
  const _AddContactScreenBody();

  @override
  Widget build(BuildContext context) {
    final Color borderColor =
        CupertinoTheme.of(context).brightness == Brightness.dark
            ? CupertinoColors.systemGrey
            : CupertinoColors.inactiveGray;

    final BorderSide borderSide = BorderSide(color: borderColor, width: 0.3);

    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        );

    final ContactsCubit cubit = context.read<ContactsCubit>();
    final ContactsState state = context.select(
      (ContactsCubit cubit) => cubit.state,
    );

    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 30,
            vertical: 10,
          ),
          child: ReactiveTextField(
            text: state.emailText,
            builder: (controller, focusNode) {
              return CupertinoTextField(
                controller: controller,
                focusNode: focusNode,
                onChanged: cubit.onEmailChanged,
                decoration: BoxDecoration(
                  border: Border(
                    bottom: borderSide,
                  ),
                ),
                style: textStyle.copyWith(fontSize: 16),
                padding: const EdgeInsets.all(15),
                suffixMode: OverlayVisibilityMode.editing,
                suffix: TextInputClearButton(
                  padding: const EdgeInsets.only(right: 9),
                  onPressed: () {
                    cubit.onEmailChanged('');
                  },
                ),
                prefix: Container(
                  decoration: BoxDecoration(
                    border: Border(right: borderSide),
                  ),
                  margin: const EdgeInsets.only(top: 15),
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 8,
                  ),
                  child: Text(
                    'Email',
                    style: textStyle.copyWith(
                      color: CupertinoTheme.of(context).primaryColor,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

class _AddContactScreenHeader extends StatelessWidget {
  const _AddContactScreenHeader();

  @override
  Widget build(BuildContext context) {
    final textStyle = CupertinoTheme.of(context).textTheme.textStyle.copyWith(
          fontSize: 16,
          fontWeight: FontWeight.w500,
        );

    final ContactsCubit cubit = context.read<ContactsCubit>();
    final ContactsState state = context.select(
      (ContactsCubit cubit) => cubit.state,
    );

    final bool validEmail = state.emailText.isNotEmpty &&
        TextInputValidator.validateEmail(state.emailText) == null;

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CupertinoButton(
          onPressed: context.pop,
          child: Text(
            'Cancel',
            style: textStyle.copyWith(
              color: CupertinoTheme.of(context).primaryColor,
            ),
          ),
        ),
        Text(
          'New contact',
          style: textStyle.copyWith(fontWeight: FontWeight.w600),
        ),
        CupertinoButton(
          onPressed: !validEmail
              ? null
              : () {
                  context.pop();
                  cubit
                    ..addContact()
                    ..onEmailChanged('');
                },
          child: Text(
            'Create',
            style: textStyle.copyWith(
              color: validEmail
                  ? CupertinoTheme.of(context).primaryColor
                  : CupertinoColors.systemGrey3,
            ),
          ),
        ),
      ],
    );
  }
}
