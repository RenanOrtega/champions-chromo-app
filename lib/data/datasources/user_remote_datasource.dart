import 'package:champions_chromo_app/data/models/user/user_model.dart';
import 'package:champions_chromo_app/data/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getCurrentUser();
}

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  return UserRemoteDataSourceImpl(apiService);
});

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final ApiService _apiService;

  UserRemoteDataSourceImpl(this._apiService);

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await _apiService.get('/users/profile');
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Falha ao obter usuário: ${e.toString()}');
    }
  }
}
