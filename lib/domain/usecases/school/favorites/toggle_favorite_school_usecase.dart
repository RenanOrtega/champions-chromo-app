import 'package:champions_chromo_app/domain/repositories/favorites_school_repository.dart';

class ToggleFavoriteSchoolUseCase {
  final FavoritesSchoolRepository repository;

  ToggleFavoriteSchoolUseCase(this.repository);

  Future<void> execute(String schoolId) async {
    final isFavorite = await repository.isSchoolFavorite(schoolId);

    if (isFavorite) {
      await repository.removeFavoriteSchool(schoolId);
    } else {
      await repository.addFavoriteSchool(schoolId);
    }
  }
}
