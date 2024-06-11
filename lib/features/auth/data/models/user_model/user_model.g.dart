// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      externalId: (json['id'] as num?)?.toInt() ?? -1,
      name: json['name'] as String? ?? '',
      bio: json['bio'] as String? ?? '',
      email: json['email'] as String? ?? '',
      isActivated: json['isActivated'] as bool? ?? false,
      createdAt: json['createdAt'] as String? ?? '',
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.externalId,
      'name': instance.name,
      'bio': instance.bio,
      'email': instance.email,
      'isActivated': instance.isActivated,
      'createdAt': instance.createdAt,
    };
