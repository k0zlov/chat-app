// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactModelImpl _$$ContactModelImplFromJson(Map<String, dynamic> json) =>
    _$ContactModelImpl(
      externalId: json['id'] as int? ?? -1,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
    );

Map<String, dynamic> _$$ContactModelImplToJson(_$ContactModelImpl instance) =>
    <String, dynamic>{
      'id': instance.externalId,
      'name': instance.name,
      'email': instance.email,
    };
