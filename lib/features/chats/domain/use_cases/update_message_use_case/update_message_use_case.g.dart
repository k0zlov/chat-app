// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_message_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateMessageParamsImpl _$$UpdateMessageParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateMessageParamsImpl(
      messageId: (json['messageId'] as num).toInt(),
      content: json['content'] as String,
    );

Map<String, dynamic> _$$UpdateMessageParamsImplToJson(
        _$UpdateMessageParamsImpl instance) =>
    <String, dynamic>{
      'messageId': instance.messageId,
      'content': instance.content,
    };
