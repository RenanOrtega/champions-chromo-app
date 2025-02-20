import 'package:champions_chromo_app/domain/entities/album_entity.dart';
import 'package:champions_chromo_app/domain/repositories/album_repository.dart';

class GetAlbumsBySchoolUseCase {
  final AlbumRepository _repository;

  GetAlbumsBySchoolUseCase(this._repository);

  Future<List<Album>> execute(String schoolId) async {
    return await _repository.getAlbumsBySchool(schoolId);
  }
}
