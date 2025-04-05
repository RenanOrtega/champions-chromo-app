import 'package:freezed_annotation/freezed_annotation.dart';

part 'pix_model.freezed.dart';
part 'pix_model.g.dart';

@freezed
class PixResponseModel with _$PixResponseModel {
  const factory PixResponseModel({
    required String? error,
    required PixModel data,
  }) = _PixResponseModel;

  factory PixResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PixResponseModelFromJson(json);
}

@freezed
class PixModel with _$PixModel {
  const factory PixModel(
      {required String id,
      required int amount,
      required String status,
      required bool devMode,
      required String brCode,
      required String brCodeBase64,
      required int platformFee,
      required String customerId,
      required String description,
      required DateTime createdAt,
      required DateTime updatedAt,
      required DateTime expiresAt}) = _PixModel;

  factory PixModel.fromJson(Map<String, dynamic> json) =>
      _$PixModelFromJson(json);
}
