
import 'package:champions_chromo_app/domain/entities/sticker_entity.dart';
import 'package:champions_chromo_app/domain/enums/operation_type.dart';
import 'package:champions_chromo_app/domain/repositories/sticker_collection_repository.dart';

class UpdateStickerCollectionUseCase {
  final StickerCollectionRepository _repository;

  UpdateStickerCollectionUseCase(this._repository);

  Future<void> execute(String albumId, String stickerNumber, StickerType stickerType, OperationType operation) async {
    return await _repository.updateStickerCollection(albumId, stickerNumber, stickerType, operation);
  }
}
