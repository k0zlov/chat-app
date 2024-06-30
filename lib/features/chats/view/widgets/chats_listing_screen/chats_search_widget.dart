import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/widgets/search/no_results_search.dart';
import 'package:chat_app/core/widgets/search/search_results_header.dart';
import 'package:chat_app/features/auth/auth_feature.dart';
import 'package:chat_app/features/auth/domain/entities/user_entity/user_entity.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/features/chats/view/widgets/chat_screen/chat_default_image.dart';
import 'package:chat_app/features/contacts/view/widgets/contacts_list_item.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ChatsSearchWidget extends StatelessWidget {
  const ChatsSearchWidget({super.key});

  String _getName(ChatEntity chat, UserEntity user) {
    final ChatParticipantEntity? participant =
        chat.participants.firstWhereOrNull(
      (e) => e.userId != user.id,
    );

    if (participant == null) return chat.title;

    return participant.name;
  }

  @override
  Widget build(BuildContext context) {
    final UserEntity currentUser =
        context.select((AuthCubit cubit) => cubit.state).currentUser;

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

    final List<ChatEntity> searchedChats = state.searchedChats
        .where(
          (chat) =>
              filteredChats.singleWhereOrNull((e) => e.id == chat.id) == null,
        )
        .toList();

    return SliverList.list(
      children: [
        if (filteredChats.isEmpty &&
            searchedChats.isEmpty &&
            !state.searchingChats) ...{
          NoResultsSearchWidget(searchText: state.searchText),
        } else ...{
          if (searchedChats.isNotEmpty) ...{
            const SearchResultsHeader(title: 'Global chats search'),
            CupertinoListSection(
              topMargin: 0,
              children: [
                for (final chat in searchedChats) ...{
                  ContactsListItem(
                    title: chat.type.isPrivate
                        ? _getName(chat, currentUser)
                        : chat.title,
                    showStatus: false,
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
                    title: chat.type.isPrivate
                        ? _getName(chat, currentUser)
                        : chat.title,
                    showStatus: false,
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
