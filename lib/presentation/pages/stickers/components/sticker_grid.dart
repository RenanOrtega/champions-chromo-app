
import 'package:champions_chromo_app/domain/entities/sticker_entity.dart';
import 'package:champions_chromo_app/presentation/providers/album_collection/album_with_collection_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StickerGrid extends ConsumerWidget {
  final String albumId;
  
  const StickerGrid({
    super.key, 
    required this.albumId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumWithCollectionAsync = ref.watch(albumWithCollectionProvider(albumId));
    
    return albumWithCollectionAsync.when(
      data: (albumWithCollection) {
        return _buildGrid(context, ref, albumWithCollection);
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Erro ao carregar figurinhas'),
            ElevatedButton(
              onPressed: () => ref.refresh(albumWithCollectionProvider(albumId)),
              child: const Text('Tentar novamente'),
            ),
          ],
        ),
      ),
    );
  }
  
  Widget _buildGrid(BuildContext context, WidgetRef ref, AlbumWithCollection albumWithCollection) {
    final stickers = albumWithCollection.processedStickers;
    
    return RefreshIndicator(
      onRefresh: () async {
        await ref.read(albumWithCollectionProvider(albumId).notifier).refresh();
      },
      child: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.75,
          crossAxisSpacing: 12,
          mainAxisSpacing: 12,
        ),
        itemCount: stickers.length,
        itemBuilder: (context, index) {
          final sticker = stickers[index];
          return StickerCard(
            sticker: sticker,
            onToggleCollection: () {
              ref.read(albumWithCollectionProvider(albumId).notifier)
                .toggleStickerCollection(sticker.number, sticker.type);
            },
          );
        },
      ),
    );
  }
}

class StickerCard extends StatelessWidget {
  final Sticker sticker;
  final VoidCallback onToggleCollection;
  
  const StickerCard({
    super.key,
    required this.sticker,
    required this.onToggleCollection,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    
    // Define a cor do cartão de acordo com o tipo da figurinha
    Color cardColor;
    String stickerTypeLabel;
    
    switch (sticker.type) {
      case StickerType.comum:
        cardColor = Colors.grey.shade200;
        stickerTypeLabel = 'Comum';
        break;
      case StickerType.quadro:
        cardColor = Colors.blue.shade100;
        stickerTypeLabel = 'Quadro';
        break;
      case StickerType.legends:
        cardColor = Colors.amber.shade100;
        stickerTypeLabel = 'Lenda';
        break;
      case StickerType.a4:
        cardColor = Colors.purple.shade100;
        stickerTypeLabel = 'A4';
        break;
    }
    
    return GestureDetector(
      onTap: onToggleCollection,
      child: Card(
        elevation: 2,
        color: sticker.isCollected ? cardColor : Colors.grey.shade300,
        child: Stack(
          children: [
            // Sobreposição para indicar que a figurinha está coletada
            if (sticker.isCollected)
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: colorScheme.primary,
                      width: 2,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
              ),
              
            // Conteúdo principal da figurinha
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Número da figurinha
                  Text(
                    '#${sticker.number}',
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: sticker.isCollected 
                        ? colorScheme.primary 
                        : Colors.grey.shade600,
                    ),
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Ícone indicativo
                  Icon(
                    sticker.isCollected ? Icons.check_circle : Icons.circle_outlined,
                    size: 32,
                    color: sticker.isCollected 
                      ? colorScheme.primary 
                      : Colors.grey.shade600,
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Tipo da figurinha
                  Text(
                    stickerTypeLabel,
                    style: TextStyle(
                      fontSize: 12,
                      color: sticker.isCollected 
                        ? colorScheme.primary 
                        : Colors.grey.shade600,
                    ),
                  ),
                  
                  // Preço da figurinha
                  Text(
                    'R\$ ${sticker.price.toStringAsFixed(2)}',
                    style: TextStyle(
                      fontSize: 10,
                      color: sticker.isCollected 
                        ? colorScheme.primary 
                        : Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            
            // Botão para marcar/desmarcar a figurinha
            Positioned(
              bottom: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: IconButton(
                  icon: Icon(
                    sticker.isCollected 
                      ? Icons.check_box 
                      : Icons.check_box_outline_blank,
                    color: sticker.isCollected 
                      ? colorScheme.primary 
                      : Colors.grey.shade600,
                  ),
                  onPressed: onToggleCollection,
                  iconSize: 24,
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}