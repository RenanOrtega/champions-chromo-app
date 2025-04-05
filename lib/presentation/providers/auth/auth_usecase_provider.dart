import 'package:champions_chromo_app/domain/repositories/auth_repository.dart';
import 'package:champions_chromo_app/domain/usecases/auth/sign_in_with_google_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/auth/sign_out_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final signInWithGoogleUseCaseProvider = Provider<SignInWithGoogleUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignInWithGoogleUseCase(repository);
});

final signOutUseCaseProvider = Provider<SignOutUseCase>((ref) {
  final repository = ref.watch(authRepositoryProvider);
  return SignOutUseCase(repository);
}); 