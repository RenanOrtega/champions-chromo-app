import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';
import 'package:champions_chromo_app/domain/entities/sticker_entity.dart';
import 'package:champions_chromo_app/domain/enums/operation_type.dart';

abstract class StickerCollectionRepository {
  Future<StickerCollection> getByUserId(String userId);

  Future<void> updateStickerCollection(String albumId, String stickerNumber,
      StickerType stickerType, OperationType operation);
}
