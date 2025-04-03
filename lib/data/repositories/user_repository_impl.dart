import 'package:champions_chromo_app/data/datasources/user_remote_datasource.dart';
import 'package:champions_chromo_app/domain/entities/user.dart';
import 'package:champions_chromo_app/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final UserRemoteDataSource _remoteDataSource;

  UserRepositoryImpl(this._remoteDataSource);

  @override
  Future<User> getCurrentUser() async {
    final userModel = await _remoteDataSource.getCurrentUser();
    return userModel.toEntity();
  }
}
