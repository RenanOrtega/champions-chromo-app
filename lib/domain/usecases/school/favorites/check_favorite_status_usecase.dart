import 'package:champions_chromo_app/domain/repositories/favorites_school_repository.dart';

class CheckFavoriteStatusUsecase {
  final FavoritesSchoolRepository repository;

  CheckFavoriteStatusUsecase(this.repository);

  Future<bool> execute(String schoolId) async {
    return await repository.isSchoolFavorite(schoolId);
  }
}
