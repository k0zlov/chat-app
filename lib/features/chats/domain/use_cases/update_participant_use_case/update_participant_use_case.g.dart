// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_participant_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UpdateParticipantParamsImpl _$$UpdateParticipantParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$UpdateParticipantParamsImpl(
      chatId: (json['chatId'] as num).toInt(),
      targetId: (json['targetId'] as num).toInt(),
      role: json['role'] as String,
    );

Map<String, dynamic> _$$UpdateParticipantParamsImplToJson(
        _$UpdateParticipantParamsImpl instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'targetId': instance.targetId,
      'role': instance.role,
    };
