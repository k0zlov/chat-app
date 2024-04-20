// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_participants_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatParticipantsResponseModelImpl
    _$$ChatParticipantsResponseModelImplFromJson(Map<String, dynamic> json) =>
        _$ChatParticipantsResponseModelImpl(
          participants: (json['items'] as List<dynamic>?)
                  ?.map((e) =>
                      ChatParticipantModel.fromJson(e as Map<String, dynamic>))
                  .toList() ??
              const [],
        );

Map<String, dynamic> _$$ChatParticipantsResponseModelImplToJson(
        _$ChatParticipantsResponseModelImpl instance) =>
    <String, dynamic>{
      'items': instance.participants,
    };
