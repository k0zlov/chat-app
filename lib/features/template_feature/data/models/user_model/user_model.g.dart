// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserResponseImpl _$$UserResponseImplFromJson(Map<String, dynamic> json) =>
    _$UserResponseImpl(
      users: (json['items'] as List<dynamic>?)
              ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$UserResponseImplToJson(_$UserResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.users,
    };

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      userid: json['userid'] as int? ?? 0,
      username: json['username'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phoneNumber: json['phonenumber'] as String? ?? '',
      passwordHash: json['passwordhash'] as String? ?? '',
      createdAt: json['createdat'] as String? ?? '',
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'username': instance.username,
      'email': instance.email,
      'phonenumber': instance.phoneNumber,
      'passwordhash': instance.passwordHash,
      'createdat': instance.createdAt,
    };
