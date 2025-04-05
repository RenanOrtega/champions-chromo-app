import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';
import 'package:champions_chromo_app/domain/entities/sticker_entity.dart';
import 'package:champions_chromo_app/domain/enums/operation_type.dart';
import 'package:champions_chromo_app/domain/usecases/stickercollection/get_by_user_id_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/stickercollection/update_sticker_collection_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/sticker_collection/sticker_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stickerCollectionProvider = StateNotifierProvider<StickerCollectionNotifier, AsyncValue<StickerCollection>>((ref) {
  return StickerCollectionNotifier(ref.watch(getByUserIdUsecaseProvider), ref.watch(updateStickerCollectionUsecaseProvider));
});

class StickerCollectionNotifier extends StateNotifier<AsyncValue<StickerCollection>> {
  final GetByUserIdUsecase _getByUserIdUsecase;
  final UpdateStickerCollectionUsecase _updateStickerCollectionUsecase;

  StickerCollectionNotifier(this._getByUserIdUsecase, this._updateStickerCollectionUsecase) : super(const AsyncValue.loading());

  Future<void> getByUserId() async {
    try {
      state = const AsyncValue.loading();
      final stickerCollection = await _getByUserIdUsecase.execute();
      state = AsyncValue.data(stickerCollection);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateStickerCollection(String albumId, String stickerNumber, StickerType stickerType, OperationType operation) async {
    try {
      state = const AsyncValue.loading();
      await _updateStickerCollectionUsecase.execute(albumId, stickerNumber, stickerType, operation);
      state = const AsyncValue.loading();
      final stickerCollection = await _getByUserIdUsecase.execute();
      state = AsyncValue.data(stickerCollection);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
