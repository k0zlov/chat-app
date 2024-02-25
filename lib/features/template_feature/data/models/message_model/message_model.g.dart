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
      messageid: json['messageid'] as int? ?? 0,
      chatid: json['chatid'] as int? ?? 0,
      userid: json['userid'] as int? ?? 0,
      content: json['content'] as String? ?? '',
      createdAt: json['createdat'] as String? ?? '',
    );

Map<String, dynamic> _$$MessageModelImplToJson(_$MessageModelImpl instance) =>
    <String, dynamic>{
      'messageid': instance.messageid,
      'chatid': instance.chatid,
      'userid': instance.userid,
      'content': instance.content,
      'createdat': instance.createdAt,
    };
