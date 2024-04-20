// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CreateChatParamsImpl _$$CreateChatParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$CreateChatParamsImpl(
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
    );

Map<String, dynamic> _$$CreateChatParamsImplToJson(
        _$CreateChatParamsImpl instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
