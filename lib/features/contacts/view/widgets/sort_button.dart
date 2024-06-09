import 'package:chat_app/core/widgets/context_menu/context_menu.dart';
import 'package:chat_app/core/widgets/context_menu/context_menu_action.dart';
import 'package:chat_app/core/widgets/sliver_search_app_bar/search_app_bar_action_item.dart';
import 'package:chat_app/di_container.dart';
import 'package:chat_app/features/chats/view/cubit/chats_cubit.dart';
import 'package:chat_app/features/contacts/contacts_feature.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsSortButton extends StatelessWidget {
  const ContactsSortButton({super.key});

  void _showContextMenu(BuildContext context) {
    final RenderBox box = context.findRenderObject()! as RenderBox;
    final Offset position = box.localToGlobal(Offset.zero);
    final Size size = box.size;

    final Offset offset = Offset(
      position.dx + size.width,
      position.dy + size.height - 20,
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
              child: _SortContextMenu(
                duration: duration,
                alignment: alignment,
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = CupertinoTheme.of(context).textTheme.textStyle;

    return SearchAppBarActionItem(
      child: Text(
        'Sort',
        style: textStyle.copyWith(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: CupertinoTheme.of(context).primaryColor,
        ),
      ),
      onPressed: () => _showContextMenu(context),
    );
  }
}

class _SortContextMenu extends StatelessWidget {
  const _SortContextMenu({
    required this.duration,
    required this.alignment,
  });

  final Alignment alignment;

  final Duration duration;


  @override
  Widget build(BuildContext context) {
    final ContactsCubit cubit = context.read<ContactsCubit>();

    return ContextMenu(
      duration: duration,
      animationAlignment: alignment,
      actions: [
        ContextMenuAction(
          title: 'by Name',
          onPressed: () => cubit.setContactsSorting(
            ContactsSort.byName,
          ),
        ),
        ContextMenuAction(
          title: 'by Last Activity',
          onPressed: () => cubit.setContactsSorting(
            ContactsSort.byLastActivity,
          ),
        ),
      ],
    );
  }
}
