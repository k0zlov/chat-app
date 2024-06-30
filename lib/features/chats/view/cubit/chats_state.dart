part of 'chats_cubit.dart';

@immutable
class ChatsState {
  const ChatsState({
    this.chats = const [],
    this.searchedChats = const [],
    this.loadingChats = false,
    this.searchingChats = false,
    this.createChatText = '',
    this.searchText = '',
    this.searchArchivedText = '',
    this.createChatType = ChatType.group,
  });

  final bool loadingChats;
  final bool searchingChats;

  final List<ChatEntity> chats;
  final List<ChatEntity> searchedChats;

  final String searchText;
  final String createChatText;

  final String searchArchivedText;

  final ChatType createChatType;

  ChatsState copyWith({
    bool? loadingChats,
    bool? searchingChats,
    List<ChatEntity>? chats,
    List<ChatEntity>? searchedChats,
    String? searchText,
    String? createChatText,
    String? searchArchivedText,
    ChatType? createChatType,
  }) {
    return ChatsState(
      loadingChats: loadingChats ?? this.loadingChats,
      searchingChats: searchingChats ?? this.searchingChats,
      chats: chats ?? this.chats,
      searchedChats: searchedChats ?? this.searchedChats,
      searchText: searchText ?? this.searchText,
      createChatText: createChatText ?? this.createChatText,
      searchArchivedText: searchArchivedText ?? this.searchArchivedText,
      createChatType: createChatType ?? this.createChatType,
    );
  }
}
