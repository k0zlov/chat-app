import 'package:chat_app/features/chats/domain/entities/chat_entity/chat_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_response_entity.freezed.dart';

/// The [ChatsResponseEntity] class represents the response entity
/// for a list of chat objects in the domain layer.
/// This class uses the `freezed` package to generate immutable value objects.
@freezed
class ChatsResponseEntity with _$ChatsResponseEntity {
  /// Creates a [ChatsResponseEntity] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `chats`: A list of chat entities, default is an empty list.
  const factory ChatsResponseEntity({
    @Default([]) List<ChatEntity> chats,
  }) = _ChatsResponseEntity;

  /// Private constructor for [ChatsResponseEntity].
  /// This is used by the `freezed` package to generate the implementation.
  const ChatsResponseEntity._();
}
