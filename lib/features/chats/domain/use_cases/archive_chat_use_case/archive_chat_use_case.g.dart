// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'archive_chat_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ArchiveChatParamsImpl _$$ArchiveChatParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$ArchiveChatParamsImpl(
      isArchived: json['isArchived'] as bool,
      chatId: (json['chatId'] as num?)?.toInt() ?? -1,
    );

Map<String, dynamic> _$$ArchiveChatParamsImplToJson(
        _$ArchiveChatParamsImpl instance) =>
    <String, dynamic>{
      'isArchived': instance.isArchived,
      'chatId': instance.chatId,
    };
