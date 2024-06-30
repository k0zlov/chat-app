part of '../chats_cubit.dart';

extension MessagesExtension on ChatsCubit {
  Future<void> sendMessage({
    required int chatId,
  }) async {
    final ChatEntity? chat = _state.chats.firstWhereOrNull(
      (chat) => chat.id == chatId,
    );

    if (chat == null || chat.text.isEmpty) {
      showError('Could not find chat with that id');
      return;
    }

    final ChatEntity loadingChat = chat.copyWith(sendingMessage: true);
    emitChat(loadingChat);

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

        emitChat(newChat);
      },
    );
  }

  Future<void> deleteMessage({
    required int chatId,
    required int messageId,
  }) async {
    final ChatEntity? chat = _state.chats.firstWhereOrNull(
      (chat) => chat.id == chatId,
    );

    if (chat == null) return;

    final MessageEntity? message = chat.messages.firstWhereOrNull(
      (e) => e.id == messageId,
    );

    if (message == null) return;

    _state = _state.copyWith(loadingChats: true);
    emit(_state);

    final failureOrSuccess = await deleteMessageUseCase(
      DeleteMessageParams(messageId: messageId),
    );

    failureOrSuccess.fold(
      (failure) => showError(failure.errorMessage),
      (_) {
        final List<MessageEntity> newMessages =
            chat.messages.where((e) => e.id != messageId).toList();

        final ChatEntity newChat = chat.copyWith(messages: newMessages);

        emitChat(newChat);
      },
    );

    _state = _state.copyWith(loadingChats: false);
    emit(_state);
  }

  Future<void> saveMessage(MessageEntity message) async {
    final ChatEntity? saveChat = _state.chats.firstWhereOrNull(
      (e) => e.type == ChatType.savedMessages,
    );

    if (saveChat == null) {
      showError('Could not find chat with saved messages');
      return;
    }

    _state = _state.copyWith(loadingChats: true);
    emit(_state);

    final failureOrEntity = await sendMessageUseCase(
      SendMessageParams(chatId: saveChat.id, content: message.content),
    );

    failureOrEntity.fold(
      (failure) => showError(failure.errorMessage),
      (entity) {
        final ChatEntity newChat = saveChat.copyWith(
          messages: [...saveChat.messages, entity],
        );

        emitChat(newChat);
      },
    );

    _state = _state.copyWith(loadingChats: false);
    emit(_state);
  }
}
