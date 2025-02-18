import 'package:champions_chromo_app/domain/entities/album_entity.dart';
import 'package:champions_chromo_app/presentation/pages/cart/components/cart_icon_button.dart';
import 'package:champions_chromo_app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SchoolAlbumListPage extends StatelessWidget {
  final String schoolName;

  final List<Album> albums = [
    Album(id: '1', name: 'Formatura 2023', totalStickers: 50),
    Album(id: '2', name: 'Festa Junina', totalStickers: 30),
    Album(id: '3', name: 'Jogos Escolares', totalStickers: 45),
    Album(id: '4', name: 'Feira de Ciências', totalStickers: 25),
  ];

  SchoolAlbumListPage({
    super.key,
    required this.schoolName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () {
            context.go(AppRoutes.schools);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              schoolName,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87),
              overflow: TextOverflow.ellipsis,
            ),
            const Text(
              'Álbuns',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                  color: Colors.black54),
            ),
          ],
        ),
        centerTitle: true,
        actions: const [CartIconButton()],
      ),
      body: Column(
        children: [
          const Divider(
            height: 1,
            thickness: 1,
            color: Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
            child: Row(
              children: [
                const Icon(Icons.photo_album, size: 22, color: Colors.blue),
                const SizedBox(width: 8),
                Text(
                  'Álbuns disponíveis (${albums.length})',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: GridView.builder(
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
                      context
                          .go('${AppRoutes.stickers}?albumName=${album.name}');
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
                            child: Icon(
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
                            padding: const EdgeInsets.symmetric(
                                horizontal: 12, vertical: 4),
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
            ),
          ),
        ],
      ),
    );
  }
}
