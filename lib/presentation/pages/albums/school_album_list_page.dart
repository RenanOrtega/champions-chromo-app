import 'package:champions_chromo_app/domain/entities/album_entity.dart';
import 'package:champions_chromo_app/presentation/pages/cart/components/cart_icon_button.dart';
import 'package:champions_chromo_app/presentation/providers/album/album_state_provider.dart';
import 'package:champions_chromo_app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SchoolAlbumListPage extends ConsumerStatefulWidget {
  final String schoolId;
  final String schoolName;

  const SchoolAlbumListPage({
    super.key,
    required this.schoolName,
    required this.schoolId,
  });

  @override
  ConsumerState<SchoolAlbumListPage> createState() =>
      _SchoolAlbumListPageState();
}

class _SchoolAlbumListPageState extends ConsumerState<SchoolAlbumListPage> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() => ref
        .read(albumsProvider.notifier)
        .getBySchoolId(widget.schoolId));
  }

  @override
  Widget build(BuildContext context) {
    final albumsState = ref.watch(albumsProvider);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          _buildHeader(context, albumsState),
          Expanded(
            child: albumsState.when(
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (error, stackTrace) => Center(
                child: Text(
                  'Erro ao carregar álbuns: ${error.toString()}',
                  style: const TextStyle(color: Colors.red),
                  textAlign: TextAlign.center,
                ),
              ),
              data: (albums) => _buildAlbumGrid(context, albums),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader(
      BuildContext context, AsyncValue<List<Album>> albumsState) {
    int albumCount = 0;
    if (albumsState is AsyncData<List<Album>>) {
      albumCount = albumsState.value.length;
    }

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade700, Colors.blue.shade500],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
        borderRadius: const BorderRadius.only(
          bottomLeft: Radius.circular(15),
          bottomRight: Radius.circular(15),
        ),
      ),
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
      ),
      child: Column(
        children: [
          const SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back, color: Colors.white),
                  onPressed: () {
                    context.go(AppRoutes.schools);
                  },
                ),
                Text(
                  'Álbuns disponíveis ($albumCount)',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const CartIconButton(Colors.white),
              ],
            ),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }

  Widget _buildAlbumGrid(BuildContext context, List<Album> albums) {
    if (albums.isEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.photo_album_outlined,
              size: 64, color: Colors.grey.shade400),
          const SizedBox(height: 16),
          const Center(
            child: Text(
              'Nenhum álbum disponível para esta escola',
              style: TextStyle(fontSize: 16, color: Colors.black54),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Tente contatar o admin',
            style: TextStyle(
              color: Colors.grey.shade600,
            ),
          ),
        ],
      );
    }

    return GridView.builder(
      padding: const EdgeInsets.all(16),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 0.8,
      ),
      itemCount: albums.length,
      itemBuilder: (context, index) {
        final album = albums[index];

        return Material(
          elevation: 3,
          borderRadius: BorderRadius.circular(12),
          child: InkWell(
            onTap: () {
              // Seleciona o álbum antes de navegar
              ref.read(selectedAlbumProvider.notifier).state = album;
              context.go(
                  '${AppRoutes.stickers}?albumName=${album.name}&albumId=${album.id}&schoolId=${widget.schoolId}&schoolName=${widget.schoolName}');
            },
            borderRadius: BorderRadius.circular(12),
            child: Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey.withValues(alpha: 0.3),
                      borderRadius: BorderRadius.circular(35),
                    ),
                    child: const Icon(
                      Icons.photo_album,
                      size: 35,
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    album.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.black87,
                    ),
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '${album.totalStickers} figurinhas',
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.black54,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
