import 'package:champions_chromo_app/data/datasources/auth_local_datasource.dart';
import 'package:champions_chromo_app/data/datasources/auth_remote_datasource.dart';
import 'package:champions_chromo_app/domain/repositories/auth_repository.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final AuthLocalDataSource _localDataSource;
  bool _isLoggedIn = false;

  @override
  AuthRepositoryImpl(this._remoteDataSource, this._localDataSource);

  @override
  bool get isLoggedIn => _isLoggedIn;

  @override
  Future<void> checkAuthStatus() async {
    final token = await _localDataSource.getToken();
    _isLoggedIn = token != null;
  }

  @override
  Future<bool> signInWithGoogle() async {
    final firebaseToken = await _remoteDataSource.signInWithGoogle();
    if (firebaseToken != null) {
      final backendToken =
          await _remoteDataSource.loginToBackend(firebaseToken);
      await _localDataSource.saveToken(backendToken);
      _isLoggedIn = true;
      return true;
    }
    return false;
  }

  @override
  Future<void> signOut() async {
    await _remoteDataSource.signOut();
    await _localDataSource.deleteToken();
    _isLoggedIn = false;
  }
}
