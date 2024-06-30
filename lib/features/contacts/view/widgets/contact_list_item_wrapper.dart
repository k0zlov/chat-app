import 'package:chat_app/core/widgets/context_menu/context_menu.dart';
import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:chat_app/features/contacts/domain/entities/contact_entity/contact_entity.dart';
import 'package:chat_app/features/contacts/view/cubit/contacts_cubit.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactListItemWrapper extends StatelessWidget {
  const ContactListItemWrapper({
    super.key,
    required this.contact,
  });

  final ContactEntity contact;

  void _showContextMenu(
    BuildContext context,
    List<ContextMenuAction> actions,
  ) {
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    final Size size = box.size;

    final Offset offset = Offset(
      position.dx + size.width,
      position.dy + size.height - 40,
    );

    final screenSize = MediaQuery.of(context).size;

    final double xFactor = (offset.dx < screenSize.width / 2) ? -1 : 1;

    final Alignment alignment = Alignment(
      xFactor,
      (offset.dy / screenSize.height) * 2 - 1,
    );

    const Duration duration = Duration(milliseconds: 240);

    showDialog<void>(
      context: context,
      useRootNavigator: false,
      barrierColor: Colors.transparent,
      builder: (context) {
        return BlocProvider.value(
          value: getIt<ChatsCubit>(),
          child: SizedBox(
            height: screenSize.height,
            width: screenSize.width,
            child: Align(
              alignment: alignment,
              child: ContextMenu(
                animationAlignment: alignment,
                duration: duration,
                actions: actions,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ChatsCubit chatsCubit = context.read<ChatsCubit>();

    final ContactsCubit cubit = context.read<ContactsCubit>();
    final ContactsState state = context.select(
      (ContactsCubit cubit) => cubit.state,
    );

    final bool alreadyInContacts = state.contacts.contains(contact);

    final List<ContextMenuAction> actions = [
      if (alreadyInContacts) ...{
        ContextMenuAction(
          title: 'Delete contact',
          iconData: CupertinoIcons.delete,
          destructive: true,
          onPressed: () => cubit.removeContact(contact),
        ),
      } else ...{
        ContextMenuAction(
          title: 'Add to contacts',
          iconData: CupertinoIcons.add,
          onPressed: () async {
            await cubit.addContact(contact.email);
            await chatsCubit.fetchChats();
          },
        ),
      },
    ];

    return ContactsListItem(
      title: contact.name,
      onPressed: () {},
      lastActivity: contact.lastActivityAt,
      onLongPressed: () => _showContextMenu(context, actions),
    );
  }
}
