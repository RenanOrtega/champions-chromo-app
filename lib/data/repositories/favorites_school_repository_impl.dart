import 'package:champions_chromo_app/domain/repositories/favorites_school_repository.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FavoritesSchoolRepositoryImpl implements FavoritesSchoolRepository {
  static const String _favoritesKey = 'favorites_schools';

  @override
  Future<void> addFavoriteSchool(String schoolId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];
    if (!favorites.contains(schoolId)) {
      favorites.add(schoolId);
      await prefs.setStringList(_favoritesKey, favorites);
    }
  }

  @override
  Future<List<String>> getFavoriteSchoolIds() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getStringList(_favoritesKey) ?? [];
  }

  @override
  Future<bool> isSchoolFavorite(String schoolId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];
    return favorites.contains(schoolId);
  }

  @override
  Future<void> removeFavoriteSchool(String schoolId) async {
    final prefs = await SharedPreferences.getInstance();
    final favorites = prefs.getStringList(_favoritesKey) ?? [];
    if (favorites.contains(schoolId)) {
      favorites.remove(schoolId);
      await prefs.setStringList(_favoritesKey, favorites);
    }
  }
}
