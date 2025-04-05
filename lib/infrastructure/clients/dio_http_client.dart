import 'dart:io';

import 'package:champions_chromo_app/constants/api_constants.dart';
import 'package:champions_chromo_app/data/datasources/auth_local_datasource.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioHttpClient {
  late final Dio _dio;
  final AuthLocalDataSource _authLocalDataSource;

  Dio get dio => _dio;

  DioHttpClient(this._authLocalDataSource) {
    _dio = Dio(BaseOptions(
      baseUrl: ApiConstants.apiBaseUrl,
      connectTimeout: const Duration(seconds: 15),
      receiveTimeout: const Duration(seconds: 15),
      validateStatus: (status) {
        return status != null && status < 500;
      },
      followRedirects: true,
      maxRedirects: 5,
    ));
    _setupInterceptors();
    _configureHttps();
  }

  void _setupInterceptors() {
    _dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          final token = await _authLocalDataSource.getToken();
          if (token != null) {
            options.headers['Authorization'] = 'Bearer $token';
          }
          return handler.next(options);
        },
        onError: (DioException error, handler) {
          if (error.response?.statusCode == 401) {
            // Tratar token expirado
          }
          return handler.next(error);
        },
      ),
    );
  }

  void _configureHttps() {
    // Configuração para aceitar certificados auto-assinados
    (_dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      
      // Para ambiente de desenvolvimento - aceita todos os certificados
      client.badCertificateCallback = (X509Certificate cert, String host, int port) {
        return true; // ⚠️ Use apenas em desenvolvimento!
      };
      
      return client;
    };
  }

  Future<Response> get(String path, {Map<String, dynamic>? queryParameters}) {
    return _dio.get(path, queryParameters: queryParameters);
  }

  Future<Response> post(String path, {dynamic data}) {
    return _dio.post(path, data: data);
  }

  Future<Response> put(String path, {dynamic data}) {
    return _dio.put(path, data: data);
  }

  Future<Response> delete(String path) {
    return _dio.delete(path);
  }
}
