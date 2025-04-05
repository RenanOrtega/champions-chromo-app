import 'package:champions_chromo_app/data/models/pix/pix_model.dart';
import 'package:champions_chromo_app/domain/entities/pix/pix_entity.dart';
import 'package:champions_chromo_app/domain/entities/pix/pix_response_entity.dart';

extension PixResponseModelExtension on PixResponseModel {
  PixResponse toDomain() {
    return PixResponse(
      error: error,
      data: data.toDomain(),
    );
  }
}

extension PixModelExtension on PixModel {
  Pix toDomain() {
    return Pix(
      id: id,
      amount: amount,
      status: status,
      devMode: devMode,
      brCode: brCode,
      brCodeBase64: brCodeBase64,
      platformFee: platformFee,
      customerId: customerId,
      description: description,
      createdAt: createdAt,
      updatedAt: updatedAt,
      expiresAt: expiresAt,
    );
  }
}
