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
      userid: json['userid'] as int? ?? 0,
      addedAt: json['addedat'] as String? ?? '',
      contactUserid: json['contactuserid'] as int? ?? 0,
    );

Map<String, dynamic> _$$ContactModelImplToJson(_$ContactModelImpl instance) =>
    <String, dynamic>{
      'userid': instance.userid,
      'addedat': instance.addedAt,
      'contactuserid': instance.contactUserid,
    };
