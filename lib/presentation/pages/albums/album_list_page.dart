import 'package:champions_chromo_app/domain/entities/album_entity.dart';
import 'package:champions_chromo_app/presentation/pages/cart/components/cart_icon_button.dart';
import 'package:champions_chromo_app/constants/route_constants.dart';
import 'package:champions_chromo_app/presentation/providers/album/album_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AlbumListPage extends ConsumerStatefulWidget {
  final String schoolId;

  const AlbumListPage({
    super.key,
    required this.schoolId,
  });

  @override
  ConsumerState<AlbumListPage> createState() => _AlbumListPageState();
}

class _AlbumListPageState extends ConsumerState<AlbumListPage> {
  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback para carregar os álbuns após a renderização inicial
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadAlbums();
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  Future<void> _loadAlbums() async {
    await ref
        .read(albumsProvider.notifier)
        .getAlbumsBySchoolId(widget.schoolId);
  }

  @override
  Widget build(BuildContext context) {
    final albumsAsync = ref.watch(albumsProvider);
    int albumCount =
        albumsAsync.value?.isNotEmpty ?? false ? albumsAsync.value!.length : 0;

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          _buildHeader(context, albumCount),
          Expanded(
            child: albumsAsync.when(
              data: (albums) => _buildAlbumGrid(context, albums),
              error: (error, stackTrace) => _buildError(context, error),
              loading: () => _buildLoading(context),
            ),
          )
        ],
      ),
    );
  }

  Widget _buildHeader(BuildContext context, int albumCount) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Colors.blue.shade700, Colors.blue.shade500],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
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
                    context.go(RouteConstants.schools);
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
              context.go(
                  '${RouteConstants.stickers}?albumName=${album.name}&albumId=${album.id}&schoolId=${widget.schoolId}');
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
                      color: Colors.grey.withOpacity(0.3),
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

  Widget _buildLoading(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(BuildContext context, Object error) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.error_outline, size: 48, color: Colors.red),
          const SizedBox(height: 16),
          const Text(
            'Erro ao carregar álbuns',
            style: TextStyle(fontSize: 16, color: Colors.black54),
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            onPressed: _loadAlbums,
            child: const Text('Tentar novamente'),
          ),
        ],
      ),
    );
  }
}
