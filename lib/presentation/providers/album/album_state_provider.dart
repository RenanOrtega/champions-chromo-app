import 'package:champions_chromo_app/domain/entities/album_entity.dart';
import 'package:champions_chromo_app/domain/usecases/album/get_album_by_id_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/album/get_albums_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/album/album_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumsProvider =
    StateNotifierProvider<AlbumsNotifier, AsyncValue<List<Album>>>((ref) {
  return AlbumsNotifier(ref.watch(getAlbumsBySchoolIdUseCaseProvider));
});

final albumProvider =
    StateNotifierProvider<AlbumNotifier, AsyncValue<Album>>((ref) {
  return AlbumNotifier(ref.watch(getAlbumByIdUseCaseProvider));
});

class AlbumsNotifier extends StateNotifier<AsyncValue<List<Album>>> {
  final GetAlbumsBySchoolIdUseCase _getAlbumsBySchoolIdUseCaseProvider;

  AlbumsNotifier(this._getAlbumsBySchoolIdUseCaseProvider) : super(const AsyncValue.loading());


  Future<void> getAlbumsBySchoolId(String schoolId) async {
    try {
      state = const AsyncValue.loading();
      final albums = await _getAlbumsBySchoolIdUseCaseProvider.execute(schoolId);
      state = AsyncValue.data(albums);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

class AlbumNotifier extends StateNotifier<AsyncValue<Album>> {
  final GetAlbumByIdUsecase _getAlbumByIdUseCaseProvider;

  AlbumNotifier(this._getAlbumByIdUseCaseProvider) : super(const AsyncValue.loading());
  
  Future<void> getAlbumById(String albumId) async {
    try {
      state = const AsyncValue.loading();
      final album = await _getAlbumByIdUseCaseProvider.execute(albumId);
      state = AsyncValue.data(album);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
