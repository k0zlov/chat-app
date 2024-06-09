import 'package:bloc/bloc.dart';
import 'package:chat_app/core/navigation/navigation.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/core/widgets/modal_pop_up.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/use_cases/erase_chats_use_case/erase_chats_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/search_chats_use_case/search_chats_use_case.dart';
import 'package:chat_app/features/chats/domain/use_cases/send_message_use_case/send_message_use_case.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';

part 'chats_state.dart';

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

  Future<void> _loadSavedChats() async {
    final failureOrChats = await getSavedChatsUseCase(NoParams());

    failureOrChats.fold(
      (failure) => showError(failure.errorMessage),
      (entity) {
        _state = _state.copyWith(chats: entity.chats);
        emit(_state);
      },
    );
  }

  Future<void> fetchChats() async {
    _state = _state.copyWith(loadingChats: true);
    emit(_state);

    final failureOrChats = await getUserChatsUseCase(NoParams());

    failureOrChats.fold(
      (failure) => showError(failure.errorMessage),
      (entity) {
        _state = _state.copyWith(chats: entity.chats);
      },
    );

    _state = _state.copyWith(loadingChats: false);
    emit(_state);
  }

  Future<void> createChat() async {
    if (_state.createChatText.length <= 2) return;

    _state = _state.copyWith(loadingChats: true);
    emit(_state);

    final failureOrChats = await createChatUseCase(
      CreateChatParams(title: _state.createChatText),
    );

    failureOrChats.fold(
      (failure) => showError(failure.errorMessage),
      (entity) {
        _state = _state.copyWith(chats: [..._state.chats, entity]);
      },
    );
    _state = _state.copyWith(loadingChats: false);
    emit(_state);
  }

  Future<void> joinChat(int chatId) async {
    _state = _state.copyWith(loadingChats: true);
    emit(_state);

    final failureOrChats = await joinChatUseCase(
      JoinChatParams(chatId: chatId),
    );

    failureOrChats.fold(
      (failure) => showError(failure.errorMessage),
      (entity) {
        _state = _state.copyWith(
          chats: [..._state.chats, entity],
          searchedChats: [],
        );
      },
    );

    _state = _state.copyWith(loadingChats: false);
    emit(_state);
  }

  Future<void> leaveChat(int chatId) async {
    _state = _state.copyWith(loadingChats: true);
    emit(_state);

    final failureOrChats = await leaveChatUseCase(
      LeaveChatParams(chatId: chatId),
    );

    failureOrChats.fold(
      (failure) {
        showError(failure.errorMessage);
      },
      (_) {
        final List<ChatEntity> newChats =
            _state.chats.where((chat) => chat.id != chatId).toList();

        _state = _state.copyWith(chats: newChats);
      },
    );
    _state = _state.copyWith(loadingChats: false);
    emit(_state);
  }

  Future<void> sendMessage({
    required int chatId,
  }) async {
    final ChatEntity? chat = _state.chats.firstWhereOrNull(
      (chat) => chat.id == chatId,
    );

    if (chat == null || chat.text.isEmpty) return;

    final ChatEntity loadingChat = chat.copyWith(sendingMessage: true);
    emitChat(emitChat: loadingChat);

    final failureOrMessage = await sendMessageUseCase(
      SendMessageParams(chatId: chatId, content: chat.text),
    );

    failureOrMessage.fold(
      (failure) {
        showError(failure.errorMessage);
      },
      (entity) {
        final ChatEntity newChat = chat.copyWith(
          text: '',
          sendingMessage: false,
          messages: [...chat.messages, entity],
        );

        emitChat(emitChat: newChat);
      },
    );
  }

  Future<void> getSearchChats() async {
    final String searchText = _state.searchText;

    Future.delayed(const Duration(milliseconds: 300), () async {
      if (searchText != _state.searchText) return;

      _state = _state.copyWith(searchingChats: true);
      emit(_state);

      final failureOrContacts = await searchChatsUseCase(
        SearchChatsParams(title: searchText),
      );

      failureOrContacts.fold(
        (failure) => showError(failure.errorMessage),
        (entity) {
          _state = _state.copyWith(searchedChats: entity.chats);
        },
      );

      _state = _state.copyWith(searchingChats: false);
      emit(_state);
    });
  }

  void onChatText({required int chatId, required String text}) {
    final ChatEntity? chat = _state.chats.firstWhereOrNull(
      (chat) => chat.id == chatId,
    );

    if (chat == null || text == chat.text) return;

    final ChatEntity newChat = chat.copyWith(text: text);
    emitChat(emitChat: newChat);
  }

  void onCreateChatText(String text) {
    if (_state.createChatText == text) return;

    _state = _state.copyWith(createChatText: text);
    emit(_state);
  }

  void onSearchText(String text) {
    if (_state.searchText == text) return;

    _state = _state.copyWith(searchText: text);
    emit(_state);

    if (text != '') {
      getSearchChats();
    } else {
      _state = _state.copyWith(searchedChats: []);
      emit(_state);
    }
  }

  void emitChat({required ChatEntity emitChat}) {
    final List<ChatEntity> newChats = _state.chats
        .where((chat) => chat.id != emitChat.id)
        .toList()
      ..add(emitChat);

    _state = _state.copyWith(chats: newChats);
    emit(_state);
  }
}
