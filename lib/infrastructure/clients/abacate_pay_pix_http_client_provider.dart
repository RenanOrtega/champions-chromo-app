import 'package:champions_chromo_app/infrastructure/clients/abacate_pay_pix_http_client.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final abacatePayPixHttpClientProvider = Provider<AbacatePayPixHttpClient>((ref) {
  return AbacatePayPixHttpClient();
});