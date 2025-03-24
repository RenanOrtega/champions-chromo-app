import 'package:freezed_annotation/freezed_annotation.dart';

part 'sticker_collection_model.freezed.dart';
part 'sticker_collection_model.g.dart';

@freezed
class StickerCollectionModel with _$StickerCollectionModel {
  const factory StickerCollectionModel({
    required String id,
    required String userId,
    required List<AlbumCollectionModel> albums,
  }) = _StickerCollectionModel;

  factory StickerCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$StickerCollectionModelFromJson(json);
}

@freezed
class AlbumCollectionModel with _$AlbumCollectionModel {
  const factory AlbumCollectionModel({
    required String albumId,
    required List<int> ownedStickers,
  }) = _AlbumCollectionModel;

  factory AlbumCollectionModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumCollectionModelFromJson(json);
}
