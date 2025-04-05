import 'package:champions_chromo_app/domain/usecases/stickercollection/get_by_user_id_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/stickercollection/update_sticker_collection_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/sticker_collection/sticker_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getByUserIdUsecaseProvider = Provider<GetByUserIdUsecase>((ref) {
  return GetByUserIdUsecase(ref.watch(stickerCollectionRepositoryProvider));
});

final updateStickerCollectionUsecaseProvider = Provider<UpdateStickerCollectionUsecase>((ref) {
  return UpdateStickerCollectionUsecase(ref.watch(stickerCollectionRepositoryProvider));
});
