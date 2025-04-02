import 'package:champions_chromo_app/domain/services/auth_service.dart';
import 'package:dio/dio.dart';

class ApiService {
  final Dio _dio;
  final AuthService _authService;

  ApiService({
    required AuthService authService,
  })  : _authService = authService,
        _dio = Dio(BaseOptions(
          baseUrl: 'http://10.0.2.2:7133/api',
          validateStatus: (status) => status! < 500,
        ));

  Future<void> _setupInterceptors() async {
    _dio.interceptors.clear();
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) async {
        if (_authService.currentUser != null) {
          final token = await _authService.currentUser!.getIdToken();
          options.headers['Authorization'] = 'Bearer $token';
        }
        return handler.next(options);
      },
      onError: (error, handler) {
        if (error.response?.statusCode == 401) {
          _authService.signOut();
        }
        return handler.next(error);
      },
    ));
  }

  Future<Map<String, dynamic>> getUserProfile() async {
    await _setupInterceptors();
    try {
      final response = await _dio.get('/users/profile');

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception(response.data['error'] ?? 'Erro ao buscar perfil');
      }
    } catch (e) {
      throw Exception('Erro ao buscar perfil: ${e.toString()}');
    }
  }

  Future<Map<String, dynamic>> updateUserProfile() async {
    await _setupInterceptors();
    try {
      final response = await _dio.post('/user');

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data;
      } else {
        throw Exception(response.data['error'] ?? 'Erro ao atualizar perfil');
      }
    } catch (e) {
      throw Exception('Erro ao atualizar perfil: ${e.toString()}');
    }
  }
}
