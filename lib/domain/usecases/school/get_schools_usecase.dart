import 'package:champions_chromo_app/domain/entities/school_entity.dart';
import 'package:champions_chromo_app/domain/repositories/school_repository.dart';

class GetSchoolsUseCase {
  final SchoolRepository schoolRepository;

  GetSchoolsUseCase(this.schoolRepository);

  Future<List<School>> execute() async {
    return await schoolRepository.getAllSchools();
  }
}
