import 'package:champions_chromo_app/domain/services/api_service.dart';
import 'package:champions_chromo_app/presentation/providers/auth_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final apiServiceProvider = Provider<ApiService>((ref) {
  final authService = ref.watch(authServiceProvider);
  return ApiService(authService: authService);
});

final userProfileProvider = FutureProvider<Map<String, dynamic>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getUserProfile();
});

final authMethodsProvider = FutureProvider<List<String>>((ref) async {
  final apiService = ref.watch(apiServiceProvider);
  return apiService.getAuthMethods();
});
