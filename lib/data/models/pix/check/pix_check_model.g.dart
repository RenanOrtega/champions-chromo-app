// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pix_check_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PixCheckModelImpl _$$PixCheckModelImplFromJson(Map<String, dynamic> json) =>
    _$PixCheckModelImpl(
      error: json['error'] as String?,
      data: PixStatusModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PixCheckModelImplToJson(_$PixCheckModelImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.data,
    };

_$PixStatusModelImpl _$$PixStatusModelImplFromJson(Map<String, dynamic> json) =>
    _$PixStatusModelImpl(
      status: json['status'] as String,
      expiresAt: DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$$PixStatusModelImplToJson(
        _$PixStatusModelImpl instance) =>
    <String, dynamic>{
      'status': instance.status,
      'expiresAt': instance.expiresAt.toIso8601String(),
    };
