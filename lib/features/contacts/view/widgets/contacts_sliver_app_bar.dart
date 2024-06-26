import 'package:chat_app/core/widgets/sliver_search_app_bar/search_app_bar_action_item.dart';
import 'package:chat_app/core/widgets/sliver_search_app_bar/sliver_search_app_bar.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/contacts/view/cubit/contacts_cubit.dart';
import 'package:chat_app/features/contacts/view/screens/add_contact_screen.dart';
import 'package:chat_app/features/contacts/view/widgets/sort_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsSliverAppBar extends StatelessWidget {
  const ContactsSliverAppBar({
    super.key,
    required this.focusNode,
  });

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    final ContactsCubit cubit = context.read<ContactsCubit>();
    final ContactsState state = context.select(
      (ContactsCubit cubit) => cubit.state,
    );

    return SliverSearchAppBar(
      text: state.searchText,
      title: 'Contacts',
      showLoadingWidget: true,
      loading: state.contactsLoading,
      onLoading: cubit.fetchContacts,
      focusNode: focusNode,
      onSubmit: (_) {},
      onChanged: cubit.onSearchChanged,
      leading: const ContactsSortButton(),
      trailing: SearchAppBarActionItem(
        child: const Icon(CupertinoIcons.plus, size: 28),
        onPressed: () {
          showCupertinoModalPopup<bool>(
            context: context,
            builder: (context) {
              return BlocProvider.value(
                value: getIt<ContactsCubit>(),
                child: const AddContactScreen(),
              );
            },
          );
        },
      ),
    );
  }
}
