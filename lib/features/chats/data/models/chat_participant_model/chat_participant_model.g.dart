// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_participant_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatParticipantModelImpl _$$ChatParticipantModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatParticipantModelImpl(
      externalId: (json['id'] as num?)?.toInt() ?? -1,
      userId: (json['userId'] as num?)?.toInt() ?? -1,
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$$ChatParticipantModelImplToJson(
        _$ChatParticipantModelImpl instance) =>
    <String, dynamic>{
      'id': instance.externalId,
      'userId': instance.userId,
      'createdAt': instance.createdAt,
    };
