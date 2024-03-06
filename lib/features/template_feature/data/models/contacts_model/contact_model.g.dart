// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactResponseImpl _$$ContactResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactResponseImpl(
      contacts: (json['items'] as List<dynamic>?)
              ?.map((e) => ContactModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ContactResponseImplToJson(
        _$ContactResponseImpl instance) =>
    <String, dynamic>{
      'items': instance.contacts,
    };

_$ContactModelImpl _$$ContactModelImplFromJson(Map<String, dynamic> json) =>
    _$ContactModelImpl(
      userId: json['user_id'] as int? ?? 0,
      addedAt: json['added_at'] as String? ?? '',
      contactUserId: json['contact_user_id'] as int? ?? 0,
    );

Map<String, dynamic> _$$ContactModelImplToJson(_$ContactModelImpl instance) =>
    <String, dynamic>{
      'user_id': instance.userId,
      'added_at': instance.addedAt,
      'contact_user_id': instance.contactUserId,
    };
