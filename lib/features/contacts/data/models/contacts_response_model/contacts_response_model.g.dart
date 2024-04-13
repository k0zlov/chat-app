// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contacts_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ContactsResponseModelImpl _$$ContactsResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ContactsResponseModelImpl(
      contacts: (json['items'] as List<dynamic>?)
              ?.map((e) => ContactModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$ContactsResponseModelImplToJson(
        _$ContactsResponseModelImpl instance) =>
    <String, dynamic>{
      'items': instance.contacts,
    };
