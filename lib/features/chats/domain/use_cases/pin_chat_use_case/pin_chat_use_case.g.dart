// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pin_chat_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PinChatParamsImpl _$$PinChatParamsImplFromJson(Map<String, dynamic> json) =>
    _$PinChatParamsImpl(
      isPinned: json['isPinned'] as bool,
      chatId: (json['chatId'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$PinChatParamsImplToJson(_$PinChatParamsImpl instance) =>
    <String, dynamic>{
      'isPinned': instance.isPinned,
      'chatId': instance.chatId,
    };
