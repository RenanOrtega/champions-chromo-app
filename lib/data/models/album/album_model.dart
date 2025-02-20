import 'package:freezed_annotation/freezed_annotation.dart';

part 'album_model.freezed.dart';
part 'album_model.g.dart';

@freezed
class AlbumModel with _$AlbumModel {
  const factory AlbumModel({
    required String id,
    required String schoolId,
    required String name,
    required double price,
    required DateTime releaseDate,
    required String coverImage,
    required List<StickerModel> commonStickers,
    required List<StickerModel> frameStickers,
    required List<StickerModel> legendStickers,
    required List<StickerModel> a4Stickers,
    required int totalStickers,
  }) = _AlbumModel;

  factory AlbumModel.fromJson(Map<String, dynamic> json) =>
      _$AlbumModelFromJson(json);
}

@freezed
class StickerModel with _$StickerModel {
  const factory StickerModel({
    required int number,
    required String name,
  }) = _StickerModel;

  factory StickerModel.fromJson(Map<String, dynamic> json) =>
      _$StickerModelFromJson(json);
}
