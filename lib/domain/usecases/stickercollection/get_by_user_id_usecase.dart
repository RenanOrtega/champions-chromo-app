import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';
import 'package:champions_chromo_app/domain/repositories/sticker_collection_repository.dart';

class GetByUserIdUsecase {
  final StickerCollectionRepository _stickerCollectionRepository;

  GetByUserIdUsecase(this._stickerCollectionRepository);
  
  Future<StickerCollection> execute() async {
    return await _stickerCollectionRepository.getByUserId();
  }
}
