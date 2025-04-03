import 'package:champions_chromo_app/data/datasources/auth_local_datasource.dart';
import 'package:champions_chromo_app/data/datasources/auth_remote_datasource.dart';
import 'package:champions_chromo_app/data/repositories/auth_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class AuthRepository {
  bool get isLoggedIn;
  Future<void> checkAuthStatus();
  Future<bool> signInWithGoogle();
  Future<void> signOut();
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  final authRemoteDataSource = ref.watch(authRemoteDataSourceProvider);
  final authLocalDataSource = ref.watch(authLocalDataSourceProvider);
  return AuthRepositoryImpl(authRemoteDataSource, authLocalDataSource);
});
