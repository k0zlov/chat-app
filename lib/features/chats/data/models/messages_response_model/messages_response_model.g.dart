// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MessagesResponseModelImpl _$$MessagesResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MessagesResponseModelImpl(
      messages: (json['items'] as List<dynamic>?)
              ?.map((e) => MessageModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$MessagesResponseModelImplToJson(
        _$MessagesResponseModelImpl instance) =>
    <String, dynamic>{
      'items': instance.messages,
    };
