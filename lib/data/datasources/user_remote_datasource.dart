import 'package:champions_chromo_app/data/models/user/user_model.dart';
import 'package:champions_chromo_app/infrastructure/clients/dio_http_client_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

abstract class UserRemoteDataSource {
  Future<UserModel> getCurrentUser();
}

final userRemoteDataSourceProvider = Provider<UserRemoteDataSource>((ref) {
  final dioHttpClient = ref.watch(dioHttpClientProvider);
  return UserRemoteDataSourceImpl(dioHttpClient);
});

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final Dio _dioHttpClient;

  UserRemoteDataSourceImpl(this._dioHttpClient);

  @override
  Future<UserModel> getCurrentUser() async {
    try {
      final response = await _dioHttpClient.get('/users/profile');
      return UserModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Falha ao obter usuário: ${e.toString()}');
    }
  }
}
