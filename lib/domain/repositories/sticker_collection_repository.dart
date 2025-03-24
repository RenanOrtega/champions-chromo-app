import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';

abstract class StickerCollectionRepository {
  Future<List<StickerCollection>> getStickerCollectionByUserIdAndAlbumId(
      String userId, String albumId);
}
