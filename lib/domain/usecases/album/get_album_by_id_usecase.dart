import 'package:champions_chromo_app/domain/entities/album_entity.dart';
import 'package:champions_chromo_app/domain/repositories/album_repository.dart';

class GetAlbumByIdUsecase {
  final AlbumRepository _repository;

  GetAlbumByIdUsecase(this._repository);

  Future<Album> execute(String albumId) async {
    return await _repository.getAlbumById(albumId);
  }
}