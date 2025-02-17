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
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go(AppRoutes.schools);
          },
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              schoolName,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const Text(
              'Álbuns',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
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
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                    childAspectRatio: 0.8),
                itemCount: albums.length,
                itemBuilder: (context, index) {
                  final album = albums[index];
                  return Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: InkWell(
                      onTap: () {
                        context.go(
                            '${AppRoutes.stickers}?albumName=${album.name}');
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              album.name,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            const SizedBox(height: 8),
                            Text(
                              '${album.totalStickers} figurinhas',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.grey),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
          ),
        ],
      ),
    );
  }
}
