// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SignUpParamsImpl _$$SignUpParamsImplFromJson(Map<String, dynamic> json) =>
    _$SignUpParamsImpl(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$$SignUpParamsImplToJson(_$SignUpParamsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
