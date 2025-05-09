import 'package:champions_chromo_app/domain/entities/customer_entity.dart';
import 'package:champions_chromo_app/domain/entities/pix/pix_response_entity.dart';

abstract class PixRepository {
  Future<PixResponse> createPix(
      int amount, int expiresIn, String description, Customer customer);
}
