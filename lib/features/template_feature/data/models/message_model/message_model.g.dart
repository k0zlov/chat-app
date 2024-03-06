// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessageResponseImpl _$$MessageResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$MessageResponseImpl(
      messages: (json['items'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MessageResponseImplToJson(
        _$MessageResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.messages,
    };

_$MessageModelImpl _$$MessageModelImplFromJson(Map<String, dynamic> json) =>
    _$MessageModelImpl(
      messageId: json['message_id'] as int? ?? 0,
      chatId: json['chat_id'] as int? ?? 0,
      userId: json['user_id'] as int? ?? 0,
      content: json['content'] as String? ?? '',
      createdAt: json['createdat'] as String? ?? '',
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'message_id': instance.messageId,
      'chat_id': instance.chatId,
      'user_id': instance.userId,
      'content': instance.content,
      'createdat': instance.createdAt,
    };
