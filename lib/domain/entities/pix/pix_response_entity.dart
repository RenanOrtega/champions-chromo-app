import 'package:champions_chromo_app/domain/entities/pix/pix_entity.dart';

class PixResponse {
  final String? error;
  final Pix data;

  PixResponse({
    this.error,
    required this.data,
  });
}
