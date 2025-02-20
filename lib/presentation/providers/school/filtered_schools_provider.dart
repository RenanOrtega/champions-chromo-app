import 'package:champions_chromo_app/domain/entities/school_entity.dart';
import 'package:champions_chromo_app/presentation/providers/school/favorites/favorites_schools_state_provider.dart';
import 'package:champions_chromo_app/presentation/providers/school/school_state_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final showOnlyFavoritesProvider = StateProvider<bool>((ref) => false);

final filteredSchoolsProvider = Provider<AsyncValue<List<School>>>((ref) {
  final schoolsAsync = ref.watch(schoolsProvider);
  final favoritesAsync = ref.watch(favoritesSchoolsProvider);
  final showOnlyFavorites = ref.watch(showOnlyFavoritesProvider);

  return schoolsAsync.when(
    data: (schools) {
      return favoritesAsync.when(
        data: (favoriteIds) {
          if (!showOnlyFavorites) {
            return AsyncValue.data(schools);
          } else {
            final filteredSchools = schools
                .where((school) => favoriteIds.contains(school.id))
                .toList();

            return AsyncValue.data(filteredSchools);
          }
        },
        loading: () => const AsyncValue.loading(),
        error: (error, stack) => AsyncValue.error(error, stack),
      );
    },
    loading: () => const AsyncValue.loading(),
    error: (error, stack) => AsyncValue.error(error, stack),
  );
});
