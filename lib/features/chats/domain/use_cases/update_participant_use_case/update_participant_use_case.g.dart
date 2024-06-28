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
      role: $enumDecode(_$ChatParticipantRoleEnumMap, json['role']),
    );

Map<String, dynamic> _$$UpdateParticipantParamsImplToJson(
        _$UpdateParticipantParamsImpl instance) =>
    <String, dynamic>{
      'chatId': instance.chatId,
      'targetId': instance.targetId,
      'role': _$ChatParticipantRoleEnumMap[instance.role]!,
    };

const _$ChatParticipantRoleEnumMap = {
  ChatParticipantRole.owner: 'owner',
  ChatParticipantRole.admin: 'admin',
  ChatParticipantRole.member: 'member',
};
