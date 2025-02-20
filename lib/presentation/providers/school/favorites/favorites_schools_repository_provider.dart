import 'package:champions_chromo_app/data/repositories/favorites_school_repository_impl.dart';
import 'package:champions_chromo_app/domain/repositories/favorites_school_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final favoritesSchoolsRepositoryProvider =
    Provider<FavoritesSchoolRepository>((ref) {
  return FavoritesSchoolRepositoryImpl();
});
