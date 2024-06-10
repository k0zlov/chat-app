part of '../chats_cubit.dart';

extension MessagesExtension on ChatsCubit {
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
}
