import 'package:champions_chromo_app/data/models/album/extensions/album_model_extension.dart';
import 'package:champions_chromo_app/data/models/album/album_model.dart';
import 'package:champions_chromo_app/domain/entities/album_entity.dart';
import 'package:champions_chromo_app/domain/repositories/album_repository.dart';
import 'package:dio/dio.dart';

class AlbumRepositoryImpl implements AlbumRepository {
  final Dio _dio;

  AlbumRepositoryImpl(this._dio);

  @override
  Future<List<Album>> getAlbumsBySchoolId(String schoolId) async {
    try {
      final response = await _dio.get('/album/schoolId/$schoolId');
      final List<dynamic> data = response.data;
      return data.map((json) => AlbumModel.fromJson(json).toDomain()).toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch albums: ${e.message}');
    }
  }

  @override
  Future<Album> getAlbumById(String albumId) async {
    try {
      final response = await _dio.get('/album/$albumId');
      return AlbumModel.fromJson(response.data).toDomain();
    } on DioException catch (e) {
      throw Exception('Failed to fetch album: ${e.message}');
    }
  }
}
