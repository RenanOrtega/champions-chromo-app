import 'package:champions_chromo_app/data/models/sticker_collection/extensions/sticker_collection_extension.dart';
import 'package:champions_chromo_app/data/models/sticker_collection/sticker_collection_model.dart';
import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';
import 'package:champions_chromo_app/domain/repositories/sticker_collection_repository.dart';
import 'package:dio/dio.dart';

class StickerCollectionRepositoryImpl implements StickerCollectionRepository {
  final Dio _dio;

  StickerCollectionRepositoryImpl(this._dio);

  @override
  Future<List<StickerCollection>> getStickerCollectionByUserIdAndAlbumId(
      String userId, String albumId) async {
    try {
      final response =
          await _dio.get('/stickercollection/userId/$userId/albumId/$albumId');
      final List<dynamic> data = response.data;
      return data
          .map((json) => StickerCollectionModel.fromJson(json).toDomain())
          .toList();
    } on DioException catch (e) {
      throw Exception('Failed to fetch sticker collection: ${e.message}');
    }
  }
}
