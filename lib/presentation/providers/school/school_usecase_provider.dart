import 'package:champions_chromo_app/domain/usecases/school/get_schools_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/school/school_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getSchoolsUseCaseProvider = Provider<GetSchoolsUseCase>((ref) {
  final repository = ref.watch(schoolRepositoryProvider);
  return GetSchoolsUseCase(repository);
});
