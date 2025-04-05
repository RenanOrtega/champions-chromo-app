import 'package:champions_chromo_app/domain/usecases/auth/sign_in_with_google_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/auth/sign_out_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/auth/auth_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authStateProvider = StateNotifierProvider<AuthNotifier, AsyncValue<bool>>((ref) {
  return AuthNotifier(
    ref.watch(signInWithGoogleUseCaseProvider),
    ref.watch(signOutUseCaseProvider),
  );
});

class AuthNotifier extends StateNotifier<AsyncValue<bool>> {
  final SignInWithGoogleUseCase _signInWithGoogleUseCase;
  final SignOutUseCase _signOutUseCase;

  AuthNotifier(
    this._signInWithGoogleUseCase,
    this._signOutUseCase,
  ) : super(const AsyncValue.loading());

  Future<void> signInWithGoogle() async {
    try {
      state = const AsyncValue.loading();
      final isLoggedIn = await _signInWithGoogleUseCase.execute();
      state = AsyncValue.data(isLoggedIn);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }

  Future<void> signOut() async {
    try {
      await _signOutUseCase.execute();
      state = const AsyncValue.data(false);
    } catch (error, stackTrace) {
      state = AsyncValue.error(error, stackTrace);
    }
  }
} 