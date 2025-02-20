import 'package:champions_chromo_app/domain/repositories/favorites_school_repository.dart';

class GetFavoriteSchoolUseCase {
  final FavoritesSchoolRepository repository;

  GetFavoriteSchoolUseCase(this.repository);

  Future<List<String>> execute() async {
    return await repository.getFavoriteSchoolIds();
  }
}
