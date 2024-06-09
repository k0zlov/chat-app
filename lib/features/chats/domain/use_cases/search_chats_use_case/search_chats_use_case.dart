import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/chats_response_entity/chats_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_chats_use_case.freezed.dart';

part 'search_chats_use_case.g.dart';

class SearchChatsUseCase
    implements UseCase<ChatsResponseEntity, SearchChatsParams> {
  const SearchChatsUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, ChatsResponseEntity>> call(
    SearchChatsParams params,
  ) {
    return repository.searchChats(params);
  }
}

@freezed
class SearchChatsParams with _$SearchChatsParams {
  const factory SearchChatsParams({
    @Default('') String title,
  }) = _SearchChatsParams;

  const SearchChatsParams._();

  factory SearchChatsParams.fromJson(Map<String, dynamic> json) =>
      _$SearchChatsParamsFromJson(json);
}
