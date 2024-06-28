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
    final ChatEntity? chat = _state.chats.firstWhereOrNull(
      (chat) => chat.id == chatId,
    );

    if (chat == null) {
      showError('Could not find that with that id');
      return;
    }

    _state = _state.copyWith(loadingChats: true);
    emit(_state);

    final failureOrSuccess = await pinChatUseCase(
      PinChatParams(isPinned: isPinned, chatId: chatId),
    );

    failureOrSuccess.fold(
      (failure) => showError(failure.errorMessage),
      emitChat,
    );

    _state = _state.copyWith(loadingChats: false);
    emit(_state);
  }

  Future<void> updateArchiveChat({
    required int chatId,
    required bool isArchived,
  }) async {
    final ChatEntity? chat = _state.chats.firstWhereOrNull(
      (chat) => chat.id == chatId,
    );

    if (chat == null) {
      showError('Could not find chat with that id');
      return;
    }

    _state = _state.copyWith(loadingChats: true);
    emit(_state);

    final failureOrSuccess = await archiveChatUseCase(
      ArchiveChatParams(isArchived: isArchived, chatId: chatId),
    );

    failureOrSuccess.fold(
      (failure) => showError(failure.errorMessage),
      emitChat,
    );

    _state = _state.copyWith(loadingChats: false);
    emit(_state);
  }

  Future<void> deleteChat({required int chatId}) async {
    final ChatEntity? chat = _state.chats.firstWhereOrNull(
      (chat) => chat.id == chatId,
    );

    if (chat == null) {
      showError('Could not find that with that id');
      return;
    }

    _state = _state.copyWith(loadingChats: true);
    emit(_state);

    final failureOrSuccess = await deleteChatUseCase(
      DeleteChatParams(chatId: chatId),
    );

    failureOrSuccess.fold(
      (failure) => showError(failure.errorMessage),
      (_) {
        final List<ChatEntity> newChats =
            _state.chats.where((e) => e.id == chatId).toList();

        _state = _state.copyWith(chats: newChats);
      },
    );

    _state = _state.copyWith(loadingChats: false);
    emit(_state);
  }

  Future<void> updateParticipant({
    required int chatId,
    required int targetId,
    required ChatParticipantRole role,
  }) async {
    final ChatEntity? chat = _state.chats.firstWhereOrNull(
      (chat) => chat.id == chatId,
    );

    if (chat == null) {
      showError('Could not find that with that id');
      return;
    }

    _state = _state.copyWith(loadingChats: true);
    emit(_state);

    final failureOrParticipants = await updateParticipantUseCase(
      UpdateParticipantParams(chatId: chatId, targetId: targetId, role: role),
    );

    failureOrParticipants.fold(
      (failure) => showError(failure.errorMessage),
      (entity) {
        final ChatEntity newChat = chat.copyWith(
          participants: entity.participants,
        );

        emitChat(newChat);
      },
    );

    _state = _state.copyWith(loadingChats: false);
    emit(_state);
  }
}
