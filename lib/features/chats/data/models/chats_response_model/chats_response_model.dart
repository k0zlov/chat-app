import 'package:chat_app/features/chats/data/models/chat_model/chat_model.dart';
import 'package:chat_app/features/chats/domain/entities/chats_response_entity/chats_response_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'chats_response_model.freezed.dart';
part 'chats_response_model.g.dart';

/// The [ChatsResponseModel] class represents the response model
/// for a list of chat objects.
/// This class uses the `freezed` package to generate immutable
/// value objects and includes JSON serialization.
@freezed
class ChatsResponseModel with _$ChatsResponseModel {
  /// Creates a [ChatsResponseModel] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `chats`: A list of chat models, default is an empty list.
  const factory ChatsResponseModel({
    @JsonKey(name: 'items') @Default([]) List<ChatModel> chats,
  }) = _ChatsResponseModel;

  /// Private constructor for [ChatsResponseModel].
  /// This is used by the `freezed` package to generate the implementation.
  const ChatsResponseModel._();

  /// Creates a [ChatsResponseModel] instance from a JSON object.
  ///
  /// This factory constructor uses the generated `_$ChatsResponseModelFromJson` function
  /// to deserialize the JSON map into a [ChatsResponseModel] instance.
  factory ChatsResponseModel.fromJson(Map<String, dynamic> json) =>
      _$ChatsResponseModelFromJson(json);

  /// Converts the [ChatsResponseModel] instance to a [ChatsResponseEntity].
  ///
  /// This method transforms the data model to a domain entity, which is used
  /// in the application's business logic. It maps each `ChatModel` to its
  /// corresponding domain entity representation.
  ChatsResponseEntity toEntity() {
    return ChatsResponseEntity(
      chats: chats.map((e) => e.toEntity()).toList(),
    );
  }
}
