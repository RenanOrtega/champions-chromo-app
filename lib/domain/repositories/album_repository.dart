import 'package:champions_chromo_app/domain/entities/album_entity.dart';

abstract class AlbumRepository {
  Future<List<Album>> getAlbumsBySchool(String schoolId);
  Future<Album> getAlbumDetails(String albumId);
}
