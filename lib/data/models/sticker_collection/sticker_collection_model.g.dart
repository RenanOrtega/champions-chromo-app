// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sticker_collection_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StickerCollectionModelImpl _$$StickerCollectionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StickerCollectionModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      albums: (json['albums'] as List<dynamic>)
          .map((e) => AlbumCollectionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StickerCollectionModelImplToJson(
        _$StickerCollectionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'albums': instance.albums,
    };

_$AlbumCollectionModelImpl _$$AlbumCollectionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AlbumCollectionModelImpl(
      albumId: json['albumId'] as String,
      ownedStickers: (json['ownedStickers'] as List<dynamic>)
          .map((e) => (e as num).toInt())
          .toList(),
    );

Map<String, dynamic> _$$AlbumCollectionModelImplToJson(
        _$AlbumCollectionModelImpl instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'ownedStickers': instance.ownedStickers,
    };
