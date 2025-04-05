import 'package:champions_chromo_app/domain/repositories/auth_repository.dart';

class SignOutUseCase {
  final AuthRepository _repository;

  SignOutUseCase(this._repository);

  Future<void> execute() async {
    await _repository.signOut();
  }
} 