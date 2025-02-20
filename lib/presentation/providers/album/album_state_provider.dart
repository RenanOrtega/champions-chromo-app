import 'package:champions_chromo_app/domain/entities/album_entity.dart';
import 'package:champions_chromo_app/domain/usecases/album/get_album_by_school_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/album/album_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final albumsProvider =
    StateNotifierProvider<AlbumsNotifier, AsyncValue<List<Album>>>((ref) {
  return AlbumsNotifier(ref.watch(getAlbumsUseCaseProvider));
});

class AlbumsNotifier extends StateNotifier<AsyncValue<List<Album>>> {
  final GetAlbumsBySchoolUseCase _getAlbumsBySchoolUseCase;

  AlbumsNotifier(this._getAlbumsBySchoolUseCase)
      : super(const AsyncValue.loading());

  Future<void> getAlbumsBySchoolId(String schoolId) async {
    try {
      state = const AsyncValue.loading();
      final albums = await _getAlbumsBySchoolUseCase.execute(schoolId);
      state = AsyncValue.data(albums);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}

final selectedAlbumProvider = StateProvider<Album?>((ref) => null);
