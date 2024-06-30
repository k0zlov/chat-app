// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_chat_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateChatParamsImpl _$$UpdateChatParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateChatParamsImpl(
      chatId: (json['chatId'] as num).toInt(),
      title: json['title'] as String? ?? null,
      description: json['description'] as String? ?? null,
      chatType: json['chatType'] as String? ?? null,
    );

Map<String, dynamic> _$$UpdateChatParamsImplToJson(
        _$UpdateChatParamsImpl instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'title': instance.title,
      'description': instance.description,
      'chatType': instance.chatType,
    };
