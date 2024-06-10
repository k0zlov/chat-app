import 'package:bloc/bloc.dart';
import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/core/widgets/modal_pop_up.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/use_cases/archive_chat_use_case/archive_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/erase_chats_use_case/erase_chats_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/pin_chat_use_case/pin_chat_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/search_chats_use_case/search_chats_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/send_message_use_case/send_message_use_case.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

part 'chats_state.dart';

part 'extensions/on_text_extension.dart';

part 'extensions/messages_extension.dart';

part 'extensions/chats_extension.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit({
    required this.createChatUseCase,
    required this.getUserChatsUseCase,
    required this.getSavedChatsUseCase,
    required this.joinChatUseCase,
    required this.leaveChatUseCase,
    required this.sendMessageUseCase,
    required this.eraseChatsUseCase,
    required this.searchChatsUseCase,
    required this.pinChatUseCase,
    required this.archiveChatUseCase,
  }) : super(const ChatsState());

  ChatsState _state = const ChatsState();

  final CreateChatUseCase createChatUseCase;
  final GetSavedChatsUseCase getSavedChatsUseCase;
  final GetUserChatsUseCase getUserChatsUseCase;
  final JoinChatUseCase joinChatUseCase;
  final LeaveChatUseCase leaveChatUseCase;
  final EraseChatsUseCase eraseChatsUseCase;

  final SendMessageUseCase sendMessageUseCase;

  final SearchChatsUseCase searchChatsUseCase;

  final PinChatUseCase pinChatUseCase;
  final ArchiveChatUseCase archiveChatUseCase;

  Future<void> onLogin() async {
    await _loadSavedChats();
    await fetchChats();
  }

  Future<void> onLogout() async {
    await eraseChatsUseCase(NoParams());
  }

  void showError(String message) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      if (AppNavigation.rootNavigatorKey.currentContext == null) {
        return;
      }
      showCupertinoModalPopup<void>(
        context: AppNavigation.rootNavigatorKey.currentContext!,
        builder: (BuildContext context) {
          return ModalPopUpContainer(
            iconData: CupertinoIcons.exclamationmark_triangle_fill,
            message: message,
          );
        },
      );
    });
  }
}
