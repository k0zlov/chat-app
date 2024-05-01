part of 'chats_cubit.dart';

@immutable
class ChatsState {
  const ChatsState({
    this.chats = const [],
    this.searchText = '',
    this.loadingChats = false,
    this.createChatText = '',
  });

  final bool loadingChats;

  final List<ChatEntity> chats;

  final String searchText;
  final String createChatText;

  ChatsState copyWith({
    bool? loadingChats,
    List<ChatEntity>? chats,
    String? searchText,
    String? createChatText,
  }) {
    return ChatsState(
      loadingChats: loadingChats ?? this.loadingChats,
      chats: chats ?? this.chats,
      searchText: searchText ?? this.searchText,
      createChatText: createChatText ?? this.createChatText,
    );
  }
}
