import 'package:bloc/bloc.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';

import 'package:meta/meta.dart';

part 'chats_state.dart';

class ChatsCubit extends Cubit<ChatsState> {
  ChatsCubit({
    required this.createChatUseCase,
    required this.getUserChatsUseCase,
    required this.getSavedChatsUseCase,
    required this.joinChatUseCase,
    required this.leaveChatUseCase,
  }) : super(ChatsState()) {
    _init();
  }

  ChatsState _state = ChatsState();

  final CreateChatUseCase createChatUseCase;
  final GetSavedChatsUseCase getSavedChatsUseCase;
  final GetUserChatsUseCase getUserChatsUseCase;
  final JoinChatUseCase joinChatUseCase;
  final LeaveChatUseCase leaveChatUseCase;

  void _init() {
    _loadSavedChats();
    fetchChats();
  }

  Future<void> _loadSavedChats() async {
    final failureOrChats = await getSavedChatsUseCase(NoParams());

    failureOrChats.fold(
      (failure) => null,
      (entity) {
        _state = _state.copyWith(chats: entity.chats);
        emit(_state);
      },
    );
  }

  Future<void> fetchChats() async {
    final failureOrChats = await getUserChatsUseCase(NoParams());

    failureOrChats.fold(
      (failure) => null,
      (entity) {
        _state = _state.copyWith(chats: entity.chats);
        emit(_state);
      },
    );
  }
}
