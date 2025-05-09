import 'package:champions_chromo_app/domain/entities/album_entity.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbumsBySchoolId(String schoolId);
  Future<Album> getAlbumById(String albumId);
}
