import 'package:champions_chromo_app/core/result.dart';
import 'package:champions_chromo_app/domain/repositories/auth_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final authControllerProvider =
    StateNotifierProvider<AuthController, Result<bool>>(
  (ref) {
    final authRepository = ref.watch(authRepositoryProvider);
    return AuthController(authRepository);
  },
);

class AuthController extends StateNotifier<Result<bool>> {
  final AuthRepository _authRepository;

  AuthController(this._authRepository) : super(const Result.initial());

  Future<void> signInWithGoogle() async {
    state = const Result.loading();
    try {
      final isLoggedIn = await _authRepository.signInWithGoogle();
      state = Result.success(isLoggedIn);
    } catch (e) {
      state = Result.error(e.toString());
    }
  }

  Future<void> signOut() async {
    await _authRepository.signOut();
  }
}
