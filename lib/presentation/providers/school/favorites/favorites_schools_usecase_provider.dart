import 'package:champions_chromo_app/domain/usecases/school/favorites/check_favorite_status_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/school/favorites/get_favorite_school_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/school/favorites/toggle_favorite_school_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/school/favorites/favorites_schools_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getFavoriteSchoolIdsUseCaseProvider =
    Provider<GetFavoriteSchoolUseCase>((ref) {
  final repository = ref.watch(favoritesSchoolsRepositoryProvider);
  return GetFavoriteSchoolUseCase(repository);
});

final toggleFavoriteSchoolUseCaseProvider =
    Provider<ToggleFavoriteSchoolUseCase>((ref) {
  final repository = ref.watch(favoritesSchoolsRepositoryProvider);
  return ToggleFavoriteSchoolUseCase(repository);
});

final checkFavoriteStatusUseCaseProvider =
    Provider<CheckFavoriteStatusUsecase>((ref) {
  final repository = ref.watch(favoritesSchoolsRepositoryProvider);
  return CheckFavoriteStatusUsecase(repository);
});
