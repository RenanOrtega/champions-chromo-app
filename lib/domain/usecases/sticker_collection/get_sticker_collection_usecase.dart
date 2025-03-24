import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';
import 'package:champions_chromo_app/domain/repositories/sticker_collection_repository.dart';

class GetStickerCollectionUseCase {
  final StickerCollectionRepository _repository;

  GetStickerCollectionUseCase(this._repository);

  Future<List<StickerCollection>> execute(String userId, String albumId) async {
    return await _repository.getStickerCollectionByUserIdAndAlbumId(
        userId, albumId);
  }
}
