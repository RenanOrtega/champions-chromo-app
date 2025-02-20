import 'package:champions_chromo_app/domain/entities/school_entity.dart';
import 'package:champions_chromo_app/domain/usecases/school/get_schools_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/school/school_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final schoolsProvider =
    StateNotifierProvider<SchoolsNotifier, AsyncValue<List<School>>>((ref) {
  return SchoolsNotifier(ref.watch(getSchoolsUseCaseProvider));
});

class SchoolsNotifier extends StateNotifier<AsyncValue<List<School>>> {
  final GetSchoolsUseCase _getSchoolsUseCase;

  SchoolsNotifier(this._getSchoolsUseCase) : super(const AsyncValue.loading()) {
    getAllSchools();
  }

  Future<void> getAllSchools() async {
    try {
      state = const AsyncValue.loading();
      final schools = await _getSchoolsUseCase.execute();
      state = AsyncValue.data(schools);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
}
