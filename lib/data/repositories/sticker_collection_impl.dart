import 'package:champions_chromo_app/data/models/sticker_collection/extensions/sticker_collection_extension.dart';
import 'package:champions_chromo_app/data/models/sticker_collection/sticker_collection_model.dart';
import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';
import 'package:champions_chromo_app/domain/entities/sticker_entity.dart';
import 'package:champions_chromo_app/domain/enums/operation_type.dart';
import 'package:champions_chromo_app/domain/repositories/sticker_collection_repository.dart';
import 'package:dio/dio.dart';

class StickerCollectionImpl extends StickerCollectionRepository {
  final Dio _dio;

  StickerCollectionImpl({required Dio dio}) : _dio = dio;

  @override
  Future<StickerCollection> getByUserId() async {
    try {
      final response = await _dio.get('/stickercollection');
      return StickerCollectionModel.fromJson(response.data).toDomain();
    } on DioException catch (e) {
      throw Exception('Failed to fetch sticker collection: ${e.message}');
    }
  }

  @override
  Future<void> updateStickerCollection(String albumId, String stickerNumber,
      StickerType stickerType, OperationType operation) async {
    try {
      final stickerTypeString = stickerType.toString().split('.').last;

      final url = operation == OperationType.add
          ? '/stickercollection/albumId/$albumId/stickerNumber/$stickerNumber/stickerType/$stickerTypeString/add'
          : '/stickercollection/albumId/$albumId/stickerNumber/$stickerNumber/stickerType/$stickerTypeString/remove';

      await _dio.patch(url);
    } on DioException catch (e) {
      throw Exception('Failed to update sticker collection: ${e.message}');
    }
  }
}
