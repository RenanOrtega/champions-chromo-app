import 'package:champions_chromo_app/domain/usecases/album/get_album_by_school_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/album/album_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAlbumsUseCaseProvider = Provider<GetAlbumsBySchoolUseCase>((ref) {
  final repository = ref.watch(albumRepositoryProvider);
  return GetAlbumsBySchoolUseCase(repository);
});
