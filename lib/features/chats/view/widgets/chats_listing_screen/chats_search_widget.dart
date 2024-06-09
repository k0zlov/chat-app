import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/widgets/search/no_results_search.dart';
import 'package:chat_app/core/widgets/search/search_results_header.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_default_image.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChatsSearchWidget extends StatelessWidget {
  const ChatsSearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ChatsState state = context.select(
      (ChatsCubit cubit) => cubit.state,
    );

    final List<ChatEntity> filteredChats = state.chats
        .where(
          (chat) => chat.title.toLowerCase().contains(
                state.searchText.toLowerCase(),
              ),
        )
        .toList();

    return SliverList.list(
      children: [
        if (filteredChats.isEmpty &&
            state.searchedChats.isEmpty &&
            !state.searchingChats) ...{
          NoResultsSearchWidget(searchText: state.searchText),
        } else ...{
          if (state.searchedChats.isNotEmpty) ...{
            const SearchResultsHeader(title: 'Global chats search'),
            CupertinoListSection(
              topMargin: 0,
              children: [
                for (final chat in state.searchedChats) ...{
                  ContactsListItem(
                    title: chat.title,
                    backgroundColor: Colors.transparent,
                    leading: ChatDefaultImage(
                      title: chat.title,
                      size: 35,
                    ),
                    onPressed: () => context.goNamed(
                      AppRoutes.chat.name,
                      pathParameters: {
                        'chatId': chat.id.toString(),
                      },
                    ),
                  ),
                },
              ],
            ),
          },
          if (filteredChats.isNotEmpty) ...{
            const SearchResultsHeader(title: 'Your chats'),
            CupertinoListSection(
              topMargin: 0,
              children: [
                for (final chat in filteredChats) ...{
                  ContactsListItem(
                    title: chat.title,
                    backgroundColor: Colors.transparent,
                    leading: ChatDefaultImage(
                      title: chat.title,
                      size: 35,
                    ),
                    onPressed: () => context.goNamed(
                      AppRoutes.chat.name,
                      pathParameters: {
                        'chatId': chat.id.toString(),
                      },
                    ),
                  ),
                },
              ],
            ),
          },
        },
        if (state.searchingChats) ...{
          const Padding(
            padding: EdgeInsets.only(top: 100),
            child: CupertinoActivityIndicator(),
          ),
        },
      ],
    );
  }
}
