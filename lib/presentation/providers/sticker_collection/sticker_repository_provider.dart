import 'package:champions_chromo_app/data/repositories/sticker_collection_impl.dart';
import 'package:champions_chromo_app/domain/repositories/sticker_collection_repository.dart';
import 'package:champions_chromo_app/infrastructure/clients/dio_http_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final stickerCollectionRepositoryProvider = Provider<StickerCollectionRepository>((ref) {
  return StickerCollectionImpl(dio: ref.watch(dioHttpClientProvider));
});