abstract class FavoritesSchoolRepository {
  Future<List<String>> getFavoriteSchoolIds();
  Future<void> addFavoriteSchool(String schoolId);
  Future<void> removeFavoriteSchool(String schoolId);
  Future<bool> isSchoolFavorite(String schoolId);
}
