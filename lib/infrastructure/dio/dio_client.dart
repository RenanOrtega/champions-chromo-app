import 'dart:io';

import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class DioClient {
  static Dio getInstance() {
    final dio = Dio(
      BaseOptions(
        baseUrl: 'https://10.0.2.2:7133/api',
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ),
    );

    (dio.httpClientAdapter as IOHttpClientAdapter).createHttpClient = () {
      final client = HttpClient();
      client.badCertificateCallback = (cert, host, port) => true;
      return client;
    };

    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          // Aqui você pode adicionar token, por exemplo
          // options.headers['Authorization'] = 'Bearer $token';
          return handler.next(options);
        },
        onResponse: (response, handler) {
          return handler.next(response);
        },
        onError: (error, handler) {
          return handler.next(error);
        },
      ),
    );

    return dio;
  }
}
