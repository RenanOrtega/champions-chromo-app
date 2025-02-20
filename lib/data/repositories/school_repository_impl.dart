import 'package:champions_chromo_app/data/models/school/extensions/school_model_extension.dart';
import 'package:champions_chromo_app/data/models/school/school_model.dart';
import 'package:champions_chromo_app/domain/entities/school_entity.dart';
import 'package:champions_chromo_app/domain/repositories/school_repository.dart';
import 'package:dio/dio.dart';

class SchoolRepositoryImpl implements SchoolRepository {
  final Dio _dio;

  SchoolRepositoryImpl(this._dio);

  @override
  Future<List<School>> getAllSchools() async {
    try {
      final response = await _dio.get('/school');
      final List<dynamic> data = response.data;
      return data.map((json) => SchoolModel.fromJson(json).toDomain()).toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch schools: ${e.message}');
    }
  }
}
