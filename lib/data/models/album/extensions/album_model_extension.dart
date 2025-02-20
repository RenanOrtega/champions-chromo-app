import 'package:champions_chromo_app/data/models/album/album_model.dart';
import 'package:champions_chromo_app/domain/entities/album_entity.dart';

extension AlbumModelExtension on AlbumModel {
  Album toDomain() {
    return Album(
      id: id,
      schoolId: schoolId,
      name: name,
      price: price,
      releaseDate: releaseDate,
      coverImage: coverImage,
      totalStickers: totalStickers,
      commonStickers:
          commonStickers.map((sticker) => sticker.toDomain()).toList(),
      frameStickers:
          frameStickers.map((sticker) => sticker.toDomain()).toList(),
      legendStickers:
          legendStickers.map((sticker) => sticker.toDomain()).toList(),
      a4Stickers: a4Stickers.map((sticker) => sticker.toDomain()).toList(),
    );
  }
}

extension StickerModelExtension on StickerModel {
  Sticker toDomain() {
    return Sticker(
      number: number,
      name: name,
    );
  }
}
