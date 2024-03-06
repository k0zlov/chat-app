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
      chatId: json['chat_id'] as int? ?? 0,
      userId: json['user_id'] as int? ?? 0,
      role: json['role'] as String? ?? '',
      joinedAt: json['joined_at'] as String? ?? '',
    );

Map<String, dynamic> _$$ChatParticipantsModelImplToJson(
        _$ChatParticipantsModelImpl instance) =>
    <String, dynamic>{
      'chat_id': instance.chatId,
      'user_id': instance.userId,
      'role': instance.role,
      'joined_at': instance.joinedAt,
    };
