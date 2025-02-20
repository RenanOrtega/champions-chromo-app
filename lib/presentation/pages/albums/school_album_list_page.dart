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
      body: Column(
        children: [
          Container(
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
              borderRadius: BorderRadius.only(
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Álbuns disponíveis (${albums.length})',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      const CartIconButton(Colors.white),
                    ],
                  ),
                ),
                const SizedBox(height: 16),
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
