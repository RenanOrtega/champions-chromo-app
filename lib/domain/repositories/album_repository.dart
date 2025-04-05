import 'package:champions_chromo_app/domain/entities/album_entity.dart';

abstract class AlbumRepository {
  Future<Album> getById(String albumId);
  Future<List<Album>> getBySchoolId(String schoolId);
}
