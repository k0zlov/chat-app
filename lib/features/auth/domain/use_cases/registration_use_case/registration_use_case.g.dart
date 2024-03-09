// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'registration_use_case.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegistrationParamsImpl _$$RegistrationParamsImplFromJson(
        Map<String, dynamic> json) =>
    _$RegistrationParamsImpl(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      password: json['password'] as String? ?? '',
    );

Map<String, dynamic> _$$RegistrationParamsImplToJson(
        _$RegistrationParamsImpl instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'password': instance.password,
    };
