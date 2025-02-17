// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemImpl _$$CartItemImplFromJson(Map<String, dynamic> json) =>
    _$CartItemImpl(
      id: json['id'] as String,
      albumName: json['albumName'] as String,
      stickerNumber: json['stickerNumber'] as String,
      type: json['type'] as String,
      price: (json['price'] as num).toDouble(),
      quantity: (json['quantity'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$$CartItemImplToJson(_$CartItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'albumName': instance.albumName,
      'stickerNumber': instance.stickerNumber,
      'type': instance.type,
      'price': instance.price,
      'quantity': instance.quantity,
    };
