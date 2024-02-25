// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatResponseImpl _$$ChatResponseImplFromJson(Map<String, dynamic> json) =>
    _$ChatResponseImpl(
      chats: (json['items'] as List<dynamic>?)
              ?.map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChatResponseImplToJson(_$ChatResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.chats,
    };

_$ChatModelImpl _$$ChatModelImplFromJson(Map<String, dynamic> json) =>
    _$ChatModelImpl(
      chatid: json['chatid'] as int? ?? 0,
      chatType: json['chattype'] as String? ?? '',
      createdAt: json['createdat'] as String? ?? '',
    );

Map<String, dynamic> _$$ChatModelImplToJson(_$ChatModelImpl instance) =>
    <String, dynamic>{
      'chatid': instance.chatid,
      'chattype': instance.chatType,
      'createdat': instance.createdAt,
    };
