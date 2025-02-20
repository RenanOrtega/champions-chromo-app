import 'package:freezed_annotation/freezed_annotation.dart';

part 'school_model.freezed.dart';
part 'school_model.g.dart';

@freezed
class SchoolModel with _$SchoolModel {
  const factory SchoolModel({
    required String id,
    required String name,
    required String email,
    required String phone,
    required String address,
    required String city,
    required String state,
  }) = _SchoolModel;

  factory SchoolModel.fromJson(Map<String, dynamic> json) =>
      _$SchoolModelFromJson(json);
}
