// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_participants_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatParticipantsResponseImpl _$$ChatParticipantsResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatParticipantsResponseImpl(
      chatParticipants: (json['items'] as List<dynamic>?)
              ?.map((e) =>
                  ChatParticipantsModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChatParticipantsResponseImplToJson(
        _$ChatParticipantsResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.chatParticipants,
    };

_$ChatParticipantsModelImpl _$$ChatParticipantsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatParticipantsModelImpl(
      chatid: json['chatid'] as int? ?? 0,
      userid: json['userid'] as int? ?? 0,
      role: json['role'] as String? ?? '',
      joinedAt: json['joinedat'] as String? ?? '',
    );

Map<String, dynamic> _$$ChatParticipantsModelImplToJson(
        _$ChatParticipantsModelImpl instance) =>
    <String, dynamic>{
      'chatid': instance.chatid,
      'userid': instance.userid,
      'role': instance.role,
      'joinedat': instance.joinedAt,
    };
