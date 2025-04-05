import 'package:champions_chromo_app/domain/usecases/album/get_album_by_id_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/album/get_albums_by_school_id_usecase.dart';
import 'package:champions_chromo_app/presentation/providers/album/album_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAlbumByIdUseCaseProvider = Provider<GetAlbumByIdUseCase>((ref) {
  final repository = ref.watch(albumRepositoryProvider);
  return GetAlbumByIdUseCase(repository);
});

final getAlbumsBySchoolIdUsecaseProvider = Provider<GetAlbumsBySchoolIdUsecase>((ref) {
  final repository = ref.watch(albumRepositoryProvider);
  return GetAlbumsBySchoolIdUsecase(repository);
});
