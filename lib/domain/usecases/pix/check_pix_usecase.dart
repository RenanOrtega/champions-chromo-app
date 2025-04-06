import 'package:champions_chromo_app/data/models/pix/check/pix_check_model.dart';
import 'package:champions_chromo_app/domain/repositories/pix_repository.dart';

class CheckPixUsecase {
  final PixRepository _repository;

  CheckPixUsecase(this._repository);

  Future<PixCheckModel> execute(String pixId) async {
    return await _repository.checkPix(pixId);
  }
}
