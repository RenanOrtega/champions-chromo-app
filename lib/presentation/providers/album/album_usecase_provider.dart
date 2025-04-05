import 'package:champions_chromo_app/domain/usecases/album/get_album_by_id_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/album/get_albums_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/album/album_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAlbumsBySchoolIdUseCaseProvider = Provider<GetAlbumsBySchoolIdUseCase>((ref) {
  final repository = ref.watch(albumRepositoryProvider);
  return GetAlbumsBySchoolIdUseCase(repository);
});

final getAlbumByIdUseCaseProvider = Provider<GetAlbumByIdUsecase>((ref) {
  final repository = ref.watch(albumRepositoryProvider);
  return GetAlbumByIdUsecase(repository);
});
