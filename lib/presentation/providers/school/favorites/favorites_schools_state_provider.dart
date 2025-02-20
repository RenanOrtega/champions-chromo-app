import 'package:champions_chromo_app/domain/usecases/school/favorites/get_favorite_school_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/school/favorites/toggle_favorite_school_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/school/favorites/favorites_schools_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesSchoolsProvider =
    StateNotifierProvider<FavoritesSchoolNotifier, AsyncValue<List<String>>>(
        (ref) {
  return FavoritesSchoolNotifier(
    ref.watch(getFavoriteSchoolIdsUseCaseProvider),
    ref.watch(toggleFavoriteSchoolUseCaseProvider),
  );
});

class FavoritesSchoolNotifier extends StateNotifier<AsyncValue<List<String>>> {
  final GetFavoriteSchoolUseCase _getFavoriteSchoolIdsUseCase;
  final ToggleFavoriteSchoolUseCase _toggleFavoriteSchoolUseCase;

  FavoritesSchoolNotifier(
    this._getFavoriteSchoolIdsUseCase,
    this._toggleFavoriteSchoolUseCase,
  ) : super(const AsyncValue.loading()) {
    loadFavorites();
  }

  Future<void> loadFavorites() async {
    try {
      state = const AsyncValue.loading();
      final favoriteIds = await _getFavoriteSchoolIdsUseCase.execute();
      state = AsyncValue.data(favoriteIds);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> toggleFavorite(String schoolId) async {
    try {
      await _toggleFavoriteSchoolUseCase.execute(schoolId);
      await loadFavorites();
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  bool isSchoolFavorite(String schoolId) {
    return state.when(
      data: (favoriteIds) => favoriteIds.contains(schoolId),
      loading: () => false,
      error: (_, __) => false,
    );
  }
}

final isSchoolFavoriteProvider = Provider.family<bool, String>((ref, schoolId) {
  final favoritesState = ref.watch(favoritesSchoolsProvider);
  return favoritesState.when(
    data: (favoriteIds) => favoriteIds.contains(schoolId),
    loading: () => false,
    error: (_, __) => false,
  );
});
