import 'package:champions_chromo_app/domain/entities/sticker_entity.dart';
import 'package:champions_chromo_app/domain/enums/operation_type.dart';
import 'package:champions_chromo_app/domain/repositories/sticker_collection_repository.dart';

class UpdateStickerCollectionUsecase {
  final StickerCollectionRepository _stickerCollectionRepository;

  UpdateStickerCollectionUsecase(this._stickerCollectionRepository);
  
  Future<void> execute(String albumId, String stickerNumber, StickerType stickerType, OperationType operation) async {
    return await _stickerCollectionRepository.updateStickerCollection(albumId, stickerNumber, stickerType, operation);
  }
}