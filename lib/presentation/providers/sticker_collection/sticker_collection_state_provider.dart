import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';
import 'package:champions_chromo_app/domain/entities/sticker_entity.dart';
import 'package:champions_chromo_app/domain/enums/operation_type.dart';
import 'package:champions_chromo_app/domain/usecases/sticker_collection/get_sticker_collection_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/sticker_collection/update_sticker_collection_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/sticker_collection/sticker_collection_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stickerCollectionProvider = StateNotifierProvider<
    StickerCollectionNotifier, AsyncValue<StickerCollection>>((ref) {
  return StickerCollectionNotifier(
      ref.watch(getStickerCollectionUseCaseProvider), ref.watch(updateStickerCollectionUseCaseProvider));
});

class StickerCollectionNotifier
    extends StateNotifier<AsyncValue<StickerCollection>> {
  final GetStickerCollectionUseCase _getStickerCollectionUseCase;
  final UpdateStickerCollectionUseCase _updateStickerCollectionUseCase;

  StickerCollectionNotifier(this._getStickerCollectionUseCase, this._updateStickerCollectionUseCase)
      : super(const AsyncValue.loading());

  Future<void> getByUserId() async {
    try {
      state = const AsyncValue.loading();
      final albums =
          await _getStickerCollectionUseCase.execute();
      state = AsyncValue.data(albums);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> updateStickerCollection(String albumId, String stickerNumber, StickerType stickerType, OperationType operation) async {
    try {
      state = const AsyncValue.loading();
      await _updateStickerCollectionUseCase.execute(albumId, stickerNumber, stickerType, operation);
      await getByUserId();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
