import 'package:chat_app/core/widgets/app_bar_search_field.dart';
import 'package:chat_app/core/widgets/reactive_text_field.dart';
import 'package:chat_app/features/contacts/view/cubit/contacts_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ContactsSliverAppBar extends StatelessWidget {
  const ContactsSliverAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    final ContactsCubit cubit = context.read<ContactsCubit>();

    final Color barColor = CupertinoTheme.of(context).barBackgroundColor;

    return SliverAppBar(
      elevation: 0,
      clipBehavior: Clip.hardEdge,
      backgroundColor: barColor,
      stretch: true,
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.zero,
        title: ReactiveTextField(
          text: '',
          builder: (controller, focusNode) {
            return AppBarSearchField(
              controller: controller,
              focusNode: focusNode,
              onChanged: (_) {},
              onSubmit: cubit.addContact,
            );
          },
        ),
      ),
    );
  }
}
