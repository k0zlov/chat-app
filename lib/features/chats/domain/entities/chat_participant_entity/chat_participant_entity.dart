import 'package:chat_app/features/chats/chats_feature.dart';
import 'package:collection/collection.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_participant_entity.freezed.dart';

/// Enum representing the roles a chat participant can have.
enum ChatParticipantRole {
  /// Owner of the chat
  owner,

  /// Admin of the chat
  admin,

  /// Simple member
  member;

  /// Checks if participant has admin rights.
  bool get isAdmin => this == admin || this == owner;

  /// Checks if participant is an owner of a chat.
  bool get isOwner => this == owner;

  /// Checks if participant is a member.
  bool get isMember => this == member;
}

/// The [ChatParticipantEntity] class represents a chat participant entity in the domain layer.
/// This class uses the `freezed` package to generate immutable value objects.
@freezed
class ChatParticipantEntity with _$ChatParticipantEntity {
  /// Creates a [ChatParticipantEntity] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `chatId`: The unique identifier of the chat the participant belongs to, default is -1.
  /// - `userId`: The unique identifier of the user, default is -1.
  /// - `name`: The name of the participant, default is an empty string.
  /// - `bio`: The bio of the user participant, default is an empty string.
  /// - `role`: The role of the participant in the chat (e.g., owner, admin, member, readonly), default is [ChatParticipantRole.member].
  /// - `joinedAt`: The date when the participant joined the chat, default is null.
  const factory ChatParticipantEntity({
    @Default(-1) int chatId,
    @Default(-1) int userId,
    @Default('') String name,
    @Default('') String bio,
    @Default(ChatParticipantRole.member) ChatParticipantRole role,
    @Default(null) DateTime? lastActivityAt,
    @Default(null) DateTime? joinedAt,
  }) = _ChatParticipantEntity;

  /// Private constructor for [ChatParticipantEntity].
  /// This is used by the `freezed` package to generate the implementation.
  const ChatParticipantEntity._();

  /// Gets [ChatParticipantEntity] from chat.
  static ChatParticipantEntity? getFromChat(ChatEntity chat, int userId) {
    return chat.participants.firstWhereOrNull(
      (p) => p.userId == userId,
    );
  }
}
