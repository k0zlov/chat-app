// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactModelImpl _$$ContactModelImplFromJson(Map<String, dynamic> json) =>
    _$ContactModelImpl(
      contactUserId: (json['contactUserId'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      addedAt: json['addedAt'] as String? ?? '',
      lastActivityAt: json['lastActivityAt'] as String? ?? '',
    );

Map<String, dynamic> _$$ContactModelImplToJson(_$ContactModelImpl instance) =>
    <String, dynamic>{
      'contactUserId': instance.contactUserId,
      'name': instance.name,
      'email': instance.email,
      'addedAt': instance.addedAt,
      'lastActivityAt': instance.lastActivityAt,
    };
