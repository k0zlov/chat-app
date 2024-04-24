// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_message_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendMessageParamsImpl _$$SendMessageParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$SendMessageParamsImpl(
      chatId: json['chatId'] as int? ?? -1,
      content: json['content'] as String? ?? '',
    );

Map<String, dynamic> _$$SendMessageParamsImplToJson(
        _$SendMessageParamsImpl instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'content': instance.content,
    };
