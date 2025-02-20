import 'package:champions_chromo_app/data/repositories/album_repository_impl.dart';
import 'package:champions_chromo_app/domain/repositories/album_repository.dart';
import 'package:champions_chromo_app/presentation/providers/dio/dio_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumRepositoryProvider = Provider<AlbumRepository>((ref) {
  final dio = ref.watch(dioProvider);
  return AlbumRepositoryImpl(dio);
});
