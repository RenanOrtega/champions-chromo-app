import 'package:champions_chromo_app/domain/entities/school_entity.dart';
import 'package:champions_chromo_app/domain/repositories/school_repository.dart';

class GetSchoolsUseCase {
  final SchoolRepository _repository;

  GetSchoolsUseCase(this._repository);

  Future<List<School>> execute() async {
    return await _repository.getAllSchools();
  }
}
