import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';
import 'package:champions_chromo_app/domain/usecases/sticker_collection/get_sticker_collection_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/sticker_collection/sticker_collection_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stickerCollectionProvider = StateNotifierProvider<
    StickerCollectionNotifier, AsyncValue<StickerCollection>>((ref) {
  return StickerCollectionNotifier(
      ref.watch(getStickerCollectionUseCaseProvider));
});

class StickerCollectionNotifier
    extends StateNotifier<AsyncValue<StickerCollection>> {
  final GetStickerCollectionUseCase _getStickerCollectionUseCase;

  StickerCollectionNotifier(this._getStickerCollectionUseCase)
      : super(const AsyncValue.loading());

  Future<void> getByUserId( 
      String userId) async {
    try {
      state = const AsyncValue.loading();
      final albums =
          await _getStickerCollectionUseCase.execute(userId);
      state = AsyncValue.data(albums);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
