import 'package:champions_chromo_app/domain/entities/album_entity.dart' show Album;
import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';
import 'package:champions_chromo_app/domain/entities/sticker_entity.dart';
import 'package:champions_chromo_app/domain/enums/operation_type.dart';
import 'package:champions_chromo_app/presentation/providers/album/album_usecase_provider.dart';
import 'package:champions_chromo_app/presentation/providers/sticker_collection/sticker_collection_usecase_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Classe que combina álbum e coleção do usuário
class AlbumWithCollection {
  final Album album;
  final AlbumCollection? userAlbum;
  final List<Sticker> processedStickers;
  final bool isLoading; // Para controlar estados de carregamento locais

  AlbumWithCollection({
    required this.album,
    required this.userAlbum,
    required this.processedStickers,
    this.isLoading = false,
  });

  // Método para atualizar a coleção criando uma nova instância com stickers atualizados
  AlbumWithCollection copyWith({
    Album? album,
    AlbumCollection? userAlbum,
    List<Sticker>? processedStickers,
    bool? isLoading,
  }) {
    return AlbumWithCollection(
      album: album ?? this.album,
      userAlbum: userAlbum ?? this.userAlbum,
      processedStickers: processedStickers ?? this.processedStickers,
      isLoading: isLoading ?? this.isLoading,
    );
  }

  // Método para marcar um sticker como coletado localmente (otimista)
  AlbumWithCollection toggleStickerCollection(int stickerNumber, StickerType type, bool collected) {
    // Cria uma cópia da lista de stickers
    final updatedStickers = processedStickers.map((sticker) {
      // Se encontrar o sticker correspondente, atualiza o status
      if (sticker.number == stickerNumber && sticker.type == type) {
        return Sticker(
          id: sticker.id,
          number: sticker.number,
          type: sticker.type,
          isCollected: collected,
          price: sticker.price,
        );
      }
      return sticker;
    }).toList();

    // Atualiza também userAlbum para manter a consistência
    AlbumCollection? updatedUserAlbum = userAlbum;
    if (userAlbum != null) {
      List<int> ownedCommonStickers = List.from(userAlbum!.ownedCommonStickers);
      List<int> ownedFrameStickers = List.from(userAlbum!.ownedFrameStickers);
      List<int> ownedLegendStickers = List.from(userAlbum!.ownedLegendStickers);
      List<int> ownedA4Stickers = List.from(userAlbum!.ownedA4Stickers);

      // Atualiza as listas conforme o tipo
      switch (type) {
        case StickerType.comum:
          if (collected && !ownedCommonStickers.contains(stickerNumber)) {
            ownedCommonStickers.add(stickerNumber);
          } else if (!collected) {
            ownedCommonStickers.remove(stickerNumber);
          }
          break;
        case StickerType.quadro:
          if (collected && !ownedFrameStickers.contains(stickerNumber)) {
            ownedFrameStickers.add(stickerNumber);
          } else if (!collected) {
            ownedFrameStickers.remove(stickerNumber);
          }
          break;
        case StickerType.legends:
          if (collected && !ownedLegendStickers.contains(stickerNumber)) {
            ownedLegendStickers.add(stickerNumber);
          } else if (!collected) {
            ownedLegendStickers.remove(stickerNumber);
          }
          break;
        case StickerType.a4:
          if (collected && !ownedA4Stickers.contains(stickerNumber)) {
            ownedA4Stickers.add(stickerNumber);
          } else if (!collected) {
            ownedA4Stickers.remove(stickerNumber);
          }
          break;
      }

      updatedUserAlbum = AlbumCollection(
        albumId: userAlbum!.albumId,
        ownedCommonStickers: ownedCommonStickers,
        ownedFrameStickers: ownedFrameStickers,
        ownedLegendStickers: ownedLegendStickers,
        ownedA4Stickers: ownedA4Stickers,
      );
    }

    return copyWith(
      processedStickers: updatedStickers,
      userAlbum: updatedUserAlbum,
    );
  }
}

// Modificado: Agora estende FamilyAsyncNotifier com o tipo de parâmetro String
class AlbumWithCollectionNotifier extends FamilyAsyncNotifier<AlbumWithCollection, String> {
  @override
  Future<AlbumWithCollection> build(String albumId) async {
    // Busca os dados do álbum
    final album = await ref.read(getAlbumByIdUseCaseProvider).execute(albumId);
    
    // Tenta carregar a coleção do usuário
    try {
      final stickerCollection = await ref.read(getStickerCollectionUseCaseProvider).execute();
      
      final userAlbum = stickerCollection.albums.firstWhere(
        (album) => album.albumId == albumId,
        orElse: () => AlbumCollection(
          albumId: albumId,
          ownedCommonStickers: [],
          ownedFrameStickers: [],
          ownedLegendStickers: [],
          ownedA4Stickers: [],
        ),
      );
      
      return _buildAlbumWithCollection(album, userAlbum, albumId);
    } catch (e) {
      // Em caso de erro ao carregar a coleção, mostra o álbum com stickers vazios
      return _buildAlbumWithCollection(album, null, albumId);
    }
  }
  
  // Método auxiliar para construir o AlbumWithCollection
  AlbumWithCollection _buildAlbumWithCollection(Album album, AlbumCollection? userAlbum, String albumId) {
    final List<Sticker> allStickers = [];
    
    // Adiciona stickers comuns
    for (var commonSticker in album.commonStickers) {
      final isCollected = userAlbum?.ownedCommonStickers.contains(commonSticker.number) ?? false;
      allStickers.add(Sticker(
        id: '${albumId}_${commonSticker.number}',
        number: commonSticker.number,
        type: StickerType.comum,
        isCollected: isCollected,
        price: 1.0,
      ));
    }
    
    // Adiciona stickers de quadro
    for (var frameSticker in album.frameStickers) {
      final isCollected = userAlbum?.ownedFrameStickers.contains(frameSticker.number) ?? false;
      allStickers.add(Sticker(
        id: '${albumId}_${frameSticker.number}',
        number: frameSticker.number,
        type: StickerType.quadro,
        isCollected: isCollected,
        price: 2.0,
      ));
    }
    
    // Adiciona stickers de lendas
    for (var legendSticker in album.legendStickers) {
      final isCollected = userAlbum?.ownedLegendStickers.contains(legendSticker.number) ?? false;
      allStickers.add(Sticker(
        id: '${albumId}_${legendSticker.number}',
        number: legendSticker.number,
        type: StickerType.legends,
        isCollected: isCollected,
        price: 3.0,
      ));
    }
    
    // Adiciona stickers A4
    for (var a4Sticker in album.a4Stickers) {
      final isCollected = userAlbum?.ownedA4Stickers.contains(a4Sticker.number) ?? false;
      allStickers.add(Sticker(
        id: '${albumId}_${a4Sticker.number}',
        number: a4Sticker.number,
        type: StickerType.a4,
        isCollected: isCollected,
        price: 5.0,
      ));
    }
    
    return AlbumWithCollection(
      album: album,
      userAlbum: userAlbum,
      processedStickers: allStickers,
    );
  }
  
  // Método para atualizar o status de um sticker
  Future<void> toggleStickerCollection(int stickerNumber, StickerType type) async {
    final albumId = arg; // Acesso ao parâmetro através da propriedade arg
    
    // Obtém o estado atual
    final currentState = state.valueOrNull;
    if (currentState == null) return;
    
    // Verifica se o sticker já está coletado
    final sticker = currentState.processedStickers.firstWhere(
      (s) => s.number == stickerNumber && s.type == type,
      orElse: () => Sticker(
        id: '${albumId}_$stickerNumber',
        number: stickerNumber,
        type: type,
        isCollected: false,
        price: 1.0,
      ),
    );
    
    final newCollectedStatus = !sticker.isCollected;
    final operationType = newCollectedStatus ? OperationType.add : OperationType.remove;
    
    // Atualiza o estado otimisticamente
    state = AsyncData(currentState.toggleStickerCollection(stickerNumber, type, newCollectedStatus));
    
    try {
      // Faz a requisição para atualizar no servidor
      await ref.read(updateStickerCollectionUseCaseProvider).execute(
        albumId, 
        stickerNumber.toString(), 
        type, 
        operationType
      );
      
      // Se houver sucesso na atualização, não precisamos fazer nada
      // O estado já está atualizado otimisticamente
    } catch (e) {
      // Em caso de erro, reverte a atualização otimista
      state = AsyncData(currentState.toggleStickerCollection(stickerNumber, type, !newCollectedStatus));
      
      // Opcionalmente, podemos lançar o erro novamente para tratamento na UI
      rethrow;
    }
  }
  
  // Método para recarregar os dados do servidor (usado raramente)
  Future<void> refresh() async {
    final albumId = arg; // Acesso ao parâmetro através da propriedade arg
    
    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      final album = await ref.read(getAlbumByIdUseCaseProvider).execute(albumId);
      final stickerCollection = await ref.read(getStickerCollectionUseCaseProvider).execute();
      
      final userAlbum = stickerCollection.albums.firstWhere(
        (album) => album.albumId == albumId,
        orElse: () => AlbumCollection(
          albumId: albumId,
          ownedCommonStickers: [],
          ownedFrameStickers: [],
          ownedLegendStickers: [],
          ownedA4Stickers: [],
        ),
      );
      
      return _buildAlbumWithCollection(album, userAlbum, albumId);
    });
  }
}

// Provider correto para Family Notifier
final albumWithCollectionProvider = AsyncNotifierProviderFamily<AlbumWithCollectionNotifier, AlbumWithCollection, String>(
  () => AlbumWithCollectionNotifier(),
);

// Provider simplificado para inicialização (opcional)
final initStickerCollectionProvider = FutureProvider<void>((ref) async {
  // Não precisa fazer nada, pois a coleção será carregada quando necessário
  return;
});