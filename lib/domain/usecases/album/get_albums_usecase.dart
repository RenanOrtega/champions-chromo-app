import 'package:champions_chromo_app/domain/entities/album_entity.dart';
import 'package:champions_chromo_app/domain/repositories/album_repository.dart';

class GetAlbumsBySchoolIdUseCase {
  final AlbumRepository _repository;

  GetAlbumsBySchoolIdUseCase(this._repository);

  Future<List<Album>> execute(String schoolId) async {
    return await _repository.getAlbumsBySchoolId(schoolId);
  }
}
