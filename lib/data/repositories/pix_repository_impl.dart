import 'package:champions_chromo_app/constants/api_constants.dart';
import 'package:champions_chromo_app/data/models/pix/check/pix_check_model.dart';
import 'package:champions_chromo_app/data/models/pix/extensions/pix_model_extension.dart';
import 'package:champions_chromo_app/data/models/pix/pix_model.dart';
import 'package:champions_chromo_app/domain/entities/customer_entity.dart';
import 'package:champions_chromo_app/domain/entities/pix/pix_response_entity.dart';
import 'package:champions_chromo_app/domain/repositories/pix_repository.dart';
import 'package:champions_chromo_app/infrastructure/clients/abacate_pay_pix_http_client.dart';
import 'package:dio/dio.dart';

class PixRepositoryImpl extends PixRepository {
  final AbacatePayPixHttpClient _abacatePayPixHttpClient;

  PixRepositoryImpl(this._abacatePayPixHttpClient);

  @override
  Future<PixResponse> createPix(
      int amount, int expiresIn, String description, Customer customer) async {
    try {
      final response = await _abacatePayPixHttpClient.post(
        '${ApiConstants.pixBaseUrl}/pixQrCode/create',
        data: {
          'amount': amount,
          'expiresIn': expiresIn,
          'description': description,
          'customer': {
            'name': customer.name,
            'email': customer.email,
            'cellphone': customer.cellphone,
            'taxId': customer.taxId,
          },
        },
      );
      final dynamic data = response.data;
      return PixResponseModel.fromJson(data).toDomain();
    } on DioException catch (e) {
      throw Exception('Failed to create pix: ${e.message}');
    }
  }

  @override
  Future<PixCheckModel> checkPix(String pixId) async {
    try {
      final response = await _abacatePayPixHttpClient
          .get('${ApiConstants.pixBaseUrl}/pixQrCode/check');
      return PixCheckModel.fromJson(response.data);
    } on DioException catch (e) {
      throw Exception('Failed to check pix: ${e.message}');
    }
  }
}
