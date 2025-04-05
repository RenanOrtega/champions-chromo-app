import 'package:champions_chromo_app/data/datasources/auth_local_datasource.dart';
import 'package:champions_chromo_app/infrastructure/clients/dio_http_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioHttpClientProvider = Provider<Dio>((ref) {
  final authLocalDataSource = ref.watch(authLocalDataSourceProvider);
  return DioHttpClient(authLocalDataSource).dio;
});

// final dioClientProvider = Provider<Dio>((ref) {
//   return ref.watch(dioHttpClientProvider).dio;
// });