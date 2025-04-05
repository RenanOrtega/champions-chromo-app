import 'package:champions_chromo_app/data/datasources/user_remote_datasource.dart';
import 'package:champions_chromo_app/data/repositories/user_repository_impl.dart';
import 'package:champions_chromo_app/domain/entities/user.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserRepository {
  Future<User> getCurrentUser();
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  final userRemoteDataSource = ref.watch(userRemoteDataSourceProvider);
  return UserRepositoryImpl(userRemoteDataSource);
});
