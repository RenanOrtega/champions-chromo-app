import 'package:champions_chromo_app/domain/entities/album_entity.dart';
import 'package:champions_chromo_app/domain/usecases/album/get_album_by_id_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/album/get_albums_by_school_id_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/album/album_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumProvider = StateNotifierProvider<AlbumNotifier, AsyncValue<Album>>((ref) {
  return AlbumNotifier(ref.watch(getAlbumByIdUseCaseProvider));
});

final albumsProvider = StateNotifierProvider<AlbumsNotifier, AsyncValue<List<Album>>>((ref) {
  return AlbumsNotifier(ref.watch(getAlbumsBySchoolIdUsecaseProvider));
});

class AlbumNotifier extends StateNotifier<AsyncValue<Album>> {
  final GetAlbumByIdUseCase _getByIdUseCase;

  AlbumNotifier(this._getByIdUseCase) : super(const AsyncValue.loading());

  Future<void> getById(String schoolId) async {
    try {
      state = const AsyncValue.loading();
      final album = await _getByIdUseCase.execute(schoolId);
      state = AsyncValue.data(album);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

class AlbumsNotifier extends StateNotifier<AsyncValue<List<Album>>> {
  final GetAlbumsBySchoolIdUsecase _getBySchoolIdUseCase;

  AlbumsNotifier(this._getBySchoolIdUseCase) : super(const AsyncValue.loading());

  Future<void> getBySchoolId(String schoolId) async {
    try {
      state = const AsyncValue.loading();
      final albums = await _getBySchoolIdUseCase.execute(schoolId);
      state = AsyncValue.data(albums);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final selectedAlbumProvider = StateProvider<Album?>((ref) => null);
