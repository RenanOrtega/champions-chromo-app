import 'package:champions_chromo_app/domain/entities/school_entity.dart';

abstract class SchoolRepository {
  Future<List<School>> getAllSchools();
}
