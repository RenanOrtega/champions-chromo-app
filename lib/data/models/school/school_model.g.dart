// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'school_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SchoolModelImpl _$$SchoolModelImplFromJson(Map<String, dynamic> json) =>
    _$SchoolModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      phone: json['phone'] as String,
      address: json['address'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
    );

Map<String, dynamic> _$$SchoolModelImplToJson(_$SchoolModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
    };
