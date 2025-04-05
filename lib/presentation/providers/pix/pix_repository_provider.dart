import 'package:champions_chromo_app/data/repositories/pix_repository_impl.dart';
import 'package:champions_chromo_app/domain/repositories/pix_repository.dart';
import 'package:champions_chromo_app/infrastructure/clients/abacate_pay_pix_http_client_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final pixRepositoryProvider = Provider<PixRepository>((ref) {
  final abacatePayPixHttpClient = ref.watch(abacatePayPixHttpClientProvider);
  return PixRepositoryImpl(abacatePayPixHttpClient);
});

