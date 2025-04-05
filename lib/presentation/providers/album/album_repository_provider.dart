import 'package:champions_chromo_app/data/repositories/album_repository_impl.dart';
import 'package:champions_chromo_app/domain/repositories/album_repository.dart';
import 'package:champions_chromo_app/infrastructure/clients/dio_http_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumRepositoryProvider = Provider<AlbumRepository>((ref) {
  final dioHttpClient = ref.watch(dioHttpClientProvider);
  return AlbumRepositoryImpl(dioHttpClient);
});
