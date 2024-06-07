import 'package:chat_app/features/chats/data/models/message_model/message_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'messages_response_model.freezed.dart';
part 'messages_response_model.g.dart';

/// The [MessagesResponseModel] class represents the response model
/// for a list of message objects.
/// This class uses the `freezed` package to generate immutable
/// value objects and includes JSON serialization.
@freezed
class MessagesResponseModel with _$MessagesResponseModel {
  /// Creates a [MessagesResponseModel] instance.
  ///
  /// The factory constructor provides default values for the fields.
  ///
  /// - `messages`: A list of message models, default is an empty list.
  const factory MessagesResponseModel({
    @JsonKey(name: 'items') @Default([]) List<MessageModel> messages,
  }) = _MessagesResponseModel;

  /// Private constructor for [MessagesResponseModel].
  /// This is used by the `freezed` package to generate the implementation.
  const MessagesResponseModel._();

  /// Creates a [MessagesResponseModel] instance from a JSON object.
  ///
  /// This factory constructor uses the generated `_$MessagesResponseModelFromJson` function
  /// to deserialize the JSON map into a [MessagesResponseModel] instance.
  factory MessagesResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MessagesResponseModelFromJson(json);
}
