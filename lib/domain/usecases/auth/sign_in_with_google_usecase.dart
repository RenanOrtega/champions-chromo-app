import 'package:champions_chromo_app/domain/repositories/auth_repository.dart';

class SignInWithGoogleUseCase {
  final AuthRepository _repository;

  SignInWithGoogleUseCase(this._repository);

  Future<bool> execute() async {
    return await _repository.signInWithGoogle();
  }
} 