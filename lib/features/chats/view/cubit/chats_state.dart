part of 'chats_cubit.dart';

@immutable
class ChatsState {
  const ChatsState({
    this.chats = const [],
  });

  final List<ChatEntity> chats;

  ChatsState copyWith({
    List<ChatEntity>? chats,
  }) {
    return ChatsState(
      chats: chats ?? this.chats,
    );
  }
}
