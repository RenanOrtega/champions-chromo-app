import 'package:champions_chromo_app/infrastructure/dio/dio_client.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return DioClient.getInstance();
});
