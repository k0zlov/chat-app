part of '../chats_cubit.dart';

extension OnTextExtension on ChatsCubit {
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
}
