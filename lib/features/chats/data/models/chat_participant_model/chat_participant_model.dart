import 'package:chat_app/features/chats/domain/entities/chat_participant_entity/chat_participant_entity.dart';
import 'package:chat_app/utils/enum_parsing/enum_parsing_extension.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_participant_model.freezed.dart';

part 'chat_participant_model.g.dart';

/// The [ChatParticipantModel] class represents the data model for a chat participant.
/// This class uses the `freezed` package to generate immutable
/// value objects and includes JSON serialization.
@freezed
class ChatParticipantModel with _$ChatParticipantModel {
  /// Creates a [ChatParticipantModel] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `chatId`: The unique identifier of the chat the participant belongs to, default is -1.
  /// - `userId`: The unique identifier of the user, default is -1.
  /// - `name`: The name of the participant, default is an empty string.
  /// - `role`: The role of the participant in the chat (e.g., member or admin), default is an empty string.
  /// - `lastActivityAt`: The date the participant had last activity in ISO 8601 format, default is an empty string.
  /// - `joinedAt`: The date the participant joined the chat in ISO 8601 format, default is an empty string.
  const factory ChatParticipantModel({
    @Default(-1) int chatId,
    @Default(-1) int userId,
    @Default('') String name,
    @Default('') String role,
    @Default('') String lastActivityAt,
    @Default('') String joinedAt,
  }) = _ChatParticipantModel;

  /// Private constructor for [ChatParticipantModel].
  /// This is used by the `freezed` package to generate the implementation.
  const ChatParticipantModel._();

  /// Creates a [ChatParticipantModel] instance from a JSON object.
  ///
  /// This factory constructor uses the generated `_$ChatParticipantModelFromJson` function
  /// to deserialize the JSON map into a [ChatParticipantModel] instance.
  factory ChatParticipantModel.fromJson(Map<String, dynamic> json) =>
      _$ChatParticipantModelFromJson(json);

  /// Converts the [ChatParticipantModel] instance to a [ChatParticipantEntity].
  ///
  /// This method transforms the data model to a domain entity, which is used
  /// in the application's business logic. It also handles the parsing of
  /// the `role` field into a [ChatParticipantRole] enum and converts `joinedAt` to a [DateTime] object.
  ChatParticipantEntity toEntity() {
    return ChatParticipantEntity(
      chatId: chatId,
      userId: userId,
      name: name,
      role: ChatParticipantRole.values.valueFromString(role) ??
          ChatParticipantRole.member,
      lastActivityAt: DateTime.tryParse(lastActivityAt),
      joinedAt: DateTime.tryParse(joinedAt),
    );
  }
}
