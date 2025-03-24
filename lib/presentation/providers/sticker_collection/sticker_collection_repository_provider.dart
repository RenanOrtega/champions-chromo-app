import 'package:champions_chromo_app/data/repositories/sticker_collection_repository_impl.dart';
import 'package:champions_chromo_app/domain/repositories/sticker_collection_repository.dart';
import 'package:champions_chromo_app/presentation/providers/dio/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stickerCollectionRepositoryProvider =
    Provider<StickerCollectionRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return StickerCollectionRepositoryImpl(dio);
});
