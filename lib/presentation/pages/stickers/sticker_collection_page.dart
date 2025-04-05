

import 'package:champions_chromo_app/presentation/pages/stickers/components/sticker_grid.dart';
import 'package:champions_chromo_app/presentation/providers/album_collection/album_with_collection_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class StickerCollectionPage extends ConsumerWidget {
  final String albumId;

  const StickerCollectionPage({
    super.key,
    required this.albumId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumWithCollectionAsync = ref.watch(albumWithCollectionProvider(albumId));
    
    return Scaffold(
      appBar: AppBar(
        title: albumWithCollectionAsync.when(
          data: (data) => Text(data.album.name),
          loading: () => const Text('Carregando...'),
          error: (_, __) => const Text('Álbum'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () => ref.refresh(albumWithCollectionProvider(albumId)),
          ),
        ],
      ),
      body: Column(
        children: [
          // Status do progresso da coleção
          albumWithCollectionAsync.when(
            data: (data) => _buildProgressSection(context, data),
            loading: () => const SizedBox(height: 100, child: Center(child: CircularProgressIndicator())),
            error: (_, __) => const SizedBox(),
          ),
          
          // Grid de figurinhas
          Expanded(
            child: StickerGrid(albumId: albumId),
          ),
        ],
      ),
    );
  }
  
  Widget _buildProgressSection(BuildContext context, AlbumWithCollection data) {
    final totalStickers = data.processedStickers.length;
    final collectedStickers = data.processedStickers.where((s) => s.isCollected).length;
    final progressPercentage = totalStickers > 0 ? (collectedStickers / totalStickers) : 0.0;
    
    return Container(
      padding: const EdgeInsets.all(16),
      color: Theme.of(context).colorScheme.surfaceVariant,
      child: Column(
        children: [
          Text(
            data.album.name,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          Text(
            'Progresso da coleção: $collectedStickers de $totalStickers figurinhas',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 8),
          LinearProgressIndicator(
            value: progressPercentage,
            backgroundColor: Colors.grey.shade300,
            valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary),
          ),
          const SizedBox(height: 8),
          Text(
            '${(progressPercentage * 100).toStringAsFixed(1)}% completo',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}