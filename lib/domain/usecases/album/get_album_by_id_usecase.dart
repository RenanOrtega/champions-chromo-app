import 'package:champions_chromo_app/domain/entities/album_entity.dart';
import 'package:champions_chromo_app/domain/repositories/album_repository.dart';

class GetAlbumByIdUseCase {
  final AlbumRepository _repository;

  GetAlbumByIdUseCase(this._repository);

  Future<Album> execute(String schoolId) async {
    return await _repository.getById(schoolId);
  }
}
