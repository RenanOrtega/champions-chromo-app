import 'package:freezed_annotation/freezed_annotation.dart';

part 'pix_check_model.freezed.dart';
part 'pix_check_model.g.dart';

@freezed
class PixCheckModel with _$PixCheckModel {
  const factory PixCheckModel({
    required String? error,
    required PixStatusModel data,
  }) = _PixCheckModel;

  factory PixCheckModel.fromJson(Map<String, dynamic> json) =>
      _$PixCheckModelFromJson(json);
}

@freezed
class PixStatusModel with _$PixStatusModel {
  const factory PixStatusModel({
    required String status,
    required DateTime expiresAt,
  }) = _PixStatusModel;

  factory PixStatusModel.fromJson(Map<String, dynamic> json) =>
      _$PixStatusModelFromJson(json);
}
