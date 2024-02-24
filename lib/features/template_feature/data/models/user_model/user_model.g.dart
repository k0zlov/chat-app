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
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'userid': instance.userid,
    };
