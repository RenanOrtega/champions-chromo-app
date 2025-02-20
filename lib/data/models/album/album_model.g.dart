// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'album_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AlbumModelImpl _$$AlbumModelImplFromJson(Map<String, dynamic> json) =>
    _$AlbumModelImpl(
      id: json['id'] as String,
      schoolId: json['schoolId'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
      releaseDate: DateTime.parse(json['releaseDate'] as String),
      coverImage: json['coverImage'] as String,
      commonStickers: (json['commonStickers'] as List<dynamic>)
          .map((e) => StickerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      frameStickers: (json['frameStickers'] as List<dynamic>)
          .map((e) => StickerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      legendStickers: (json['legendStickers'] as List<dynamic>)
          .map((e) => StickerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      a4Stickers: (json['a4Stickers'] as List<dynamic>)
          .map((e) => StickerModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      totalStickers: (json['totalStickers'] as num).toInt(),
    );

Map<String, dynamic> _$$AlbumModelImplToJson(_$AlbumModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'schoolId': instance.schoolId,
      'name': instance.name,
      'price': instance.price,
      'releaseDate': instance.releaseDate.toIso8601String(),
      'coverImage': instance.coverImage,
      'commonStickers': instance.commonStickers,
      'frameStickers': instance.frameStickers,
      'legendStickers': instance.legendStickers,
      'a4Stickers': instance.a4Stickers,
      'totalStickers': instance.totalStickers,
    };

_$StickerModelImpl _$$StickerModelImplFromJson(Map<String, dynamic> json) =>
    _$StickerModelImpl(
      number: (json['number'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$$StickerModelImplToJson(_$StickerModelImpl instance) =>
    <String, dynamic>{
      'number': instance.number,
      'name': instance.name,
    };
