import 'package:champions_chromo_app/domain/usecases/sticker_collection/get_sticker_collection_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/sticker_collection/sticker_collection_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getStickerCollectionUseCaseProvider =
    Provider<GetStickerCollectionUseCase>((ref) {
  final repository = ref.watch(stickerCollectionRepositoryProvider);
  return GetStickerCollectionUseCase(repository);
});
