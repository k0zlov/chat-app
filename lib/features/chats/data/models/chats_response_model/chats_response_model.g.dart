// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chats_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatsResponseModelImpl _$$ChatsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChatsResponseModelImpl(
      chats: (json['items'] as List<dynamic>?)
              ?.map((e) => ChatModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ChatsResponseModelImplToJson(
        _$ChatsResponseModelImpl instance) =>
    <String, dynamic>{
      'items': instance.chats,
    };
