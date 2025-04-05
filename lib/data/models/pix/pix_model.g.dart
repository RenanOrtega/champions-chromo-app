// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pix_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PixResponseModelImpl _$$PixResponseModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PixResponseModelImpl(
      error: json['error'] as String?,
      data: PixModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PixResponseModelImplToJson(
        _$PixResponseModelImpl instance) =>
    <String, dynamic>{
      'error': instance.error,
      'data': instance.data,
    };

_$PixModelImpl _$$PixModelImplFromJson(Map<String, dynamic> json) =>
    _$PixModelImpl(
      id: json['id'] as String,
      amount: (json['amount'] as num).toInt(),
      status: json['status'] as String,
      devMode: json['devMode'] as bool,
      brCode: json['brCode'] as String,
      brCodeBase64: json['brCodeBase64'] as String,
      platformFee: (json['platformFee'] as num).toInt(),
      customerId: json['customerId'] as String,
      description: json['description'] as String,
      createdAt: DateTime.parse(json['createdAt'] as String),
      updatedAt: DateTime.parse(json['updatedAt'] as String),
      expiresAt: DateTime.parse(json['expiresAt'] as String),
    );

Map<String, dynamic> _$$PixModelImplToJson(_$PixModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': instance.amount,
      'status': instance.status,
      'devMode': instance.devMode,
      'brCode': instance.brCode,
      'brCodeBase64': instance.brCodeBase64,
      'platformFee': instance.platformFee,
      'customerId': instance.customerId,
      'description': instance.description,
      'createdAt': instance.createdAt.toIso8601String(),
      'updatedAt': instance.updatedAt.toIso8601String(),
      'expiresAt': instance.expiresAt.toIso8601String(),
    };
