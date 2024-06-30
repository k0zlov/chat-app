import 'package:chat_app/core/errors/failure.dart';
import 'package:chat_app/core/use_cases/use_case.dart';
import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:chat_app/features/chats/domain/entities/chat_participants_response_entity/chat_participants_response_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'update_participant_use_case.freezed.dart';

part 'update_participant_use_case.g.dart';

class UpdateParticipantUseCase
    implements
        UseCase<ChatParticipantsResponseEntity, UpdateParticipantParams> {
  const UpdateParticipantUseCase({
    required this.repository,
  });

  final ChatsRepository repository;

  @override
  Future<Either<Failure, ChatParticipantsResponseEntity>> call(
    UpdateParticipantParams params,
  ) {
    return repository.updateParticipant(params);
  }
}

@freezed
class UpdateParticipantParams with _$UpdateParticipantParams {
  const factory UpdateParticipantParams({
    required int chatId,
    required int targetId,
    required String role,
  }) = _UpdateParticipantParams;

  const UpdateParticipantParams._();

  factory UpdateParticipantParams.fromJson(Map<String, dynamic> json) =>
      _$UpdateParticipantParamsFromJson(json);
}
