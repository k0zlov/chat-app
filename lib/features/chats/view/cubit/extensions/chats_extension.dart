part of '../chats_cubit.dart';

extension ChatsExtension on ChatsCubit {
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

  Future<void> updatePinChat({
    required int chatId,
    required bool isPinned,
  }) async {
    _state = _state.copyWith(loadingChats: true);
    emit(_state);

    final ChatEntity? chat = _state.chats.firstWhereOrNull(
      (chat) => chat.id == chatId,
    );

    if (chat == null) {
      showError('Could not find that with that id');
      return;
    }

    final failureOrSuccess = await pinChatUseCase(
      PinChatParams(isPinned: isPinned, chatId: chatId),
    );

    failureOrSuccess.fold(
      (failure) => showError(failure.errorMessage),
      (entity) {
        emitChat(emitChat: entity);
      },
    );

    _state = _state.copyWith(loadingChats: false);
    emit(_state);
  }

  Future<void> updateArchiveChat({
    required int chatId,
    required bool isArchived,
  }) async {
    _state = _state.copyWith(loadingChats: true);
    emit(_state);

    final ChatEntity? chat = _state.chats.firstWhereOrNull(
      (chat) => chat.id == chatId,
    );

    if (chat == null) {
      showError('Could not find that with that id');
      return;
    }

    final failureOrSuccess = await archiveChatUseCase(
      ArchiveChatParams(isArchived: isArchived, chatId: chatId),
    );

    failureOrSuccess.fold(
      (failure) => showError(failure.errorMessage),
      (entity) {
        emitChat(emitChat: entity);
      },
    );

    _state = _state.copyWith(loadingChats: false);
    emit(_state);
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
