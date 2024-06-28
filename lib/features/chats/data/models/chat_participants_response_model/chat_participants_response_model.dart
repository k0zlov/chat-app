import 'package:chat_app/features/chats/data/models/chat_participant_model/chat_participant_model.dart';
import 'package:chat_app/features/chats/domain/entities/chat_participants_response_entity/chat_participants_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_participants_response_model.freezed.dart';

part 'chat_participants_response_model.g.dart';

/// The [ChatParticipantsResponseModel] class represents the response model
/// for a list of chat participants.
/// This class uses the `freezed` package to generate immutable
/// value objects and includes JSON serialization.
@freezed
class ChatParticipantsResponseModel with _$ChatParticipantsResponseModel {
  /// Creates a [ChatParticipantsResponseModel] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `participants`: A list of chat participants, default is an empty list.
  const factory ChatParticipantsResponseModel({
    @JsonKey(name: 'items')
    @Default([])
    List<ChatParticipantModel> participants,
  }) = _ChatParticipantsResponseModel;

  /// Private constructor for [ChatParticipantsResponseModel].
  /// This is used by the `freezed` package to generate the implementation.
  const ChatParticipantsResponseModel._();

  /// Creates a [ChatParticipantsResponseModel] instance from a JSON object.
  ///
  /// This factory constructor uses the generated `_$ChatParticipantsResponseModelFromJson` function
  /// to deserialize the JSON map into a [ChatParticipantsResponseModel] instance.
  factory ChatParticipantsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatParticipantsResponseModelFromJson(json);

  /// Converts the [ChatParticipantsResponseModel] instance to a [ChatParticipantsResponseEntity].
  ///
  /// This method transforms the data model to a domain entity, which is used
  /// in the application's business logic. It maps each `ChatParticipant` to its
  /// corresponding domain entity representation.
  ChatParticipantsResponseEntity toEntity() {
    return ChatParticipantsResponseEntity(
      participants: participants.map((e) => e.toEntity()).toList(),
    );
  }
}
