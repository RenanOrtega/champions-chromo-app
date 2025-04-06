import 'package:champions_chromo_app/domain/usecases/pix/check_pix_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/pix/create_pix_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/pix/pix_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final createPixUseCaseProvider = Provider<CreatePixUseCase>((ref) {
  final repository = ref.watch(pixRepositoryProvider);
  return CreatePixUseCase(repository);
});

final checkPixUseCaseProvider = Provider<CheckPixUsecase>((ref) {
  final repository = ref.watch(pixRepositoryProvider);
  return CheckPixUsecase(repository);
});
