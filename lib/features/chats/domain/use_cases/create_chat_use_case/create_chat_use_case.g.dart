// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateChatParamsImpl _$$CreateChatParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateChatParamsImpl(
      title: json['title'] as String? ?? '',
      chatType: json['chatType'] as String? ?? null,
      description: json['description'] as String? ?? null,
    );

Map<String, dynamic> _$$CreateChatParamsImplToJson(
        _$CreateChatParamsImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'chatType': instance.chatType,
      'description': instance.description,
    };
