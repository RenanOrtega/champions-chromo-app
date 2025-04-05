import 'package:champions_chromo_app/domain/entities/customer_entity.dart';
import 'package:champions_chromo_app/domain/entities/pix/pix_response_entity.dart';
import 'package:champions_chromo_app/domain/repositories/pix_repository.dart';

class CreatePixUseCase {
  final PixRepository _repository;

  CreatePixUseCase(this._repository);

  Future<PixResponse> execute(int amount, int expiresIn, String description, Customer customer) async {
    return await _repository.createPix(amount, expiresIn, description, customer);
  }
  
}
