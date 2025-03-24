import 'package:champions_chromo_app/data/models/sticker_collection/sticker_collection_model.dart';
import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';

extension StickerCollectionExtension on StickerCollectionModel {
  StickerCollection toDomain() {
    return StickerCollection(
      id: id,
      userId: userId,
      albums: albums.map((album) => album.toDomain()).toList(),
    );
  }
}

extension AlbumCollectionExtension on AlbumCollectionModel {
  AlbumCollection toDomain() {
    return AlbumCollection(
      albumId: albumId,
      ownedStickers: ownedStickers,
    );
  }
}
