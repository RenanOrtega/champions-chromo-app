import 'package:champions_chromo_app/domain/entities/album_entity.dart'
    as album;
import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';
import 'package:champions_chromo_app/domain/entities/sticker_entity.dart';
import 'package:champions_chromo_app/domain/entities/cart/cart_item_entity.dart';
import 'package:champions_chromo_app/domain/enums/operation_type.dart';
import 'package:champions_chromo_app/presentation/pages/cart/components/cart_icon_button.dart';
import 'package:champions_chromo_app/presentation/providers/album/album_repository_provider.dart';
import 'package:champions_chromo_app/presentation/providers/cart/notifiers/cart_notifier.dart';
import 'package:champions_chromo_app/presentation/providers/sticker_collection/sticker_collection_repository_provider.dart';
import 'package:champions_chromo_app/presentation/providers/sticker_collection/sticker_collection_state_provider.dart';
import 'package:champions_chromo_app/presentation/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class AlbumStickerListPage extends ConsumerStatefulWidget {
  final String albumName;
  final String albumId;

  const AlbumStickerListPage({
    super.key,
    required this.albumName,
    required this.albumId,
  });

  @override
  ConsumerState<AlbumStickerListPage> createState() =>
      _AlbumStickerListPageState();
}

class _AlbumStickerListPageState extends ConsumerState<AlbumStickerListPage> {
  late List<Sticker> stickers = [];
  bool isLoading = true;
  album.Album? albumData;
  AlbumCollection? userAlbumData;

  @override
  void initState() {
    super.initState();
    _loadStickers();
  }

  Future<void> _loadStickers() async {
    setState(() {
      isLoading = true;
    });

    try {
      final albumRepository = ref.read(albumRepositoryProvider);
      final stickerCollectionRepository =
          ref.read(stickerCollectionRepositoryProvider);

      // Carrega dados do álbum
      final schoolId = await _getSchoolIdFromAlbumId(widget.albumId);
      final albumsResult = await albumRepository.getAlbumsBySchoolId(schoolId);

      // Encontra o álbum específico pelo ID
      albumData = albumsResult.firstWhere(
        (album) => album.id == widget.albumId,
        orElse: () => throw Exception('Álbum não encontrado'),
      );

      // Carrega figurinhas que o usuário possui
      final userId =
          '67e4673a0e3e3ccb456476e3'; // TODO: Obter ID do usuário atual do provedor de autenticação
      final userAlbumsResult =
          await stickerCollectionRepository.getByUserId(userId);

      final userAlbum = userAlbumsResult.albums;
      userAlbumData = userAlbum.firstWhere(
        (album) => album.albumId == widget.albumId,
        orElse: () => AlbumCollection(
          albumId: widget.albumId,
          ownedCommonStickers: [],
          ownedFrameStickers: [],
          ownedLegendStickers: [],
          ownedA4Stickers: [],
        ),
      );

      // Combina os dados para criar a lista de figurinhas
      _buildStickersList();

      setState(() {
        isLoading = false;
      });
    } catch (error) {
      print('Erro ao carregar figurinhas: $error');
      setState(() {
        isLoading = false;
        stickers = [];
      });

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao carregar figurinhas: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  Future<String> _getSchoolIdFromAlbumId(String albumId) async {
    // TODO: Implementar a lógica para obter o schoolId do albumId
    // Esta é uma simplificação - você pode precisar fazer uma chamada adicional à API
    // ou armazenar esta informação quando o usuário navega para esta página
    return '67e46b4d335556bea30379bf';
  }

  void _buildStickersList() {
    if (albumData == null) return;

    final List<Sticker> allStickers = [];

    // Adiciona figurinhas comuns
    for (var commonSticker in albumData!.commonStickers) {
      final isCollected =
          userAlbumData?.ownedCommonStickers.contains(commonSticker.number) ??
              false;
      allStickers.add(Sticker(
        id: '${widget.albumId}_${commonSticker.number}',
        number: commonSticker.number,
        type: StickerType.comum,
        isCollected: isCollected,
        price: 1.0, // TODO: Get price from album data
      ));
    }

    // Adiciona figurinhas quadro
    for (var frameSticker in albumData!.frameStickers) {
      final isCollected =
          userAlbumData?.ownedFrameStickers.contains(frameSticker.number) ??
              false;
      allStickers.add(Sticker(
        id: '${widget.albumId}_${frameSticker.number}',
        number: frameSticker.number,
        type: StickerType.quadro,
        isCollected: isCollected,
        price: 1.0, // TODO: Get price from album data
      ));
    }

    // Adiciona figurinhas legends
    for (var legendSticker in albumData!.legendStickers) {
      final isCollected =
          userAlbumData?.ownedLegendStickers.contains(legendSticker.number) ??
              false;
      allStickers.add(Sticker(
        id: '${widget.albumId}_${legendSticker.number}',
        number: legendSticker.number,
        type: StickerType.legends,
        isCollected: isCollected,
        price: 1.0, // TODO: Get price from album data
      ));
    }

    // Adiciona figurinhas A4
    for (var a4Sticker in albumData!.a4Stickers) {
      final isCollected =
          userAlbumData?.ownedA4Stickers.contains(a4Sticker.number) ?? false;
      allStickers.add(Sticker(
        id: '${widget.albumId}_${a4Sticker.number}',
        number: a4Sticker.number,
        type: StickerType.a4,
        isCollected: isCollected,
        price: 1.0, // TODO: Get price from album data
      ));
    }

    setState(() {
      stickers = allStickers;
    });
  }

  void _updateStickerCollection(
      Sticker sticker, OperationType operation) async {
    try {
      final stickerCollectionRepository =
          ref.read(stickerCollectionRepositoryProvider);
      final userId =
          '67e4673a0e3e3ccb456476e3'; // TODO: Obter ID do usuário atual do provedor de autenticação

      // Atualiza a coleção no backend
      await stickerCollectionRepository.updateStickerCollection(
          widget.albumId, sticker.number.toString(), sticker.type, operation);

      // Atualiza a UI
      setState(() {
        final index = stickers.indexWhere((s) => s.id == sticker.id);
        if (index != -1) {
          stickers[index].isCollected = operation == OperationType.add;
        }
      });

      // Recarrega os dados da coleção para manter a consistência
      await ref.read(stickerCollectionProvider.notifier).getByUserId(userId);
    } catch (error) {
      print('Erro ao atualizar coleção: $error');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao atualizar coleção: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showStickerOptions(
      BuildContext context, WidgetRef ref, Sticker sticker) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 5,
                margin: const EdgeInsets.symmetric(vertical: 10),
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2.5),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Container(
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(8),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Text(
                          sticker.number.toString(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Figurinha #${sticker.number}',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            'Tipo: ${_getStickerTypeName(sticker.type)}',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: Icon(
                  Icons.add_circle_outline,
                  color: sticker.isCollected ? Colors.grey : Colors.green,
                ),
                title: const Text('Marcar como obtida'),
                enabled: !sticker.isCollected,
                onTap: () {
                  _updateStickerCollection(sticker, OperationType.add);
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: Icon(
                  Icons.remove_circle_outline,
                  color: sticker.isCollected ? Colors.red : Colors.grey,
                ),
                title: const Text('Desmarcar como obtida'),
                enabled: sticker.isCollected,
                onTap: () {
                  _updateStickerCollection(sticker, OperationType.remove);
                  Navigator.pop(context);
                },
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(16),
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.shopping_cart),
                  label: const Text('Adicionar ao carrinho'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    ref.read(cartProvider.notifier).addItem(
                          CartItem(
                            id: sticker.id,
                            stickerNumber: sticker.number.toString(),
                            type: _getStickerTypeName(sticker.type),
                            albumName: widget.albumName,
                            price: sticker.price,
                            quantity: 1,
                          ),
                        );
                    Navigator.pop(context);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Row(
                          children: [
                            const Icon(Icons.check_circle, color: Colors.white),
                            const SizedBox(width: 8),
                            const Text('Figurinha adicionada ao carrinho'),
                          ],
                        ),
                        backgroundColor: Colors.green,
                        behavior: SnackBarBehavior.floating,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  String _getStickerTypeName(StickerType type) {
    switch (type) {
      case StickerType.comum:
        return 'Comum';
      case StickerType.quadro:
        return 'Quadro';
      case StickerType.legends:
        return 'Legends';
      case StickerType.a4:
        return 'A4';
    }
  }

  Color _getStickerTypeColor(StickerType type) {
    switch (type) {
      case StickerType.comum:
        return Colors.blue;
      case StickerType.quadro:
        return Colors.purple;
      case StickerType.legends:
        return Colors.orange;
      case StickerType.a4:
        return Colors.teal;
    }
  }

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
                          context.go(AppRoutes.schools);
                        },
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.albumName,
                            style: const TextStyle(
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
            child: isLoading
                ? const Center(
                    child: CircularProgressIndicator(),
                  )
                : stickers.isEmpty
                    ? const Center(child: Text('Sem figurinhas disponíveis'))
                    : ListView(
                        padding: const EdgeInsets.all(16),
                        children: [
                          _buildStickerSection('Comuns', StickerType.comum),
                          const SizedBox(height: 24),
                          _buildStickerSection('Quadro', StickerType.quadro),
                          const SizedBox(height: 24),
                          _buildStickerSection('Legends', StickerType.legends),
                          const SizedBox(height: 24),
                          _buildStickerSection('A4', StickerType.a4),
                        ],
                      ),
          ),
          if (!isLoading && stickers.isNotEmpty) _buildSummary(),
        ],
      ),
    );
  }

  Widget _buildStickerSection(String title, StickerType type) {
    final sectionStickers = stickers.where((s) => s.type == type).toList();
    if (sectionStickers.isEmpty) return Container(); // Não exibe seções vazias

    final collectedCount = sectionStickers.where((s) => s.isCollected).length;
    final totalCount = sectionStickers.length;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    color: _getStickerTypeColor(type),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.image,
                    color: Colors.white,
                    size: 14,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    '$collectedCount/$totalCount',
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
            child: LinearProgressIndicator(
              value: totalCount > 0 ? collectedCount / totalCount : 0,
              backgroundColor: Colors.grey[200],
              valueColor:
                  AlwaysStoppedAnimation<Color>(_getStickerTypeColor(type)),
              minHeight: 6,
              borderRadius: BorderRadius.circular(3),
            ),
          ),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 5,
              crossAxisSpacing: 8,
              mainAxisSpacing: 8,
              childAspectRatio: 1,
            ),
            itemCount: sectionStickers.length,
            itemBuilder: (context, index) {
              final sticker = sectionStickers[index];
              return _buildStickerItem(sticker);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildStickerItem(Sticker sticker) {
    return InkWell(
      onTap: () => _showStickerOptions(context, ref, sticker),
      borderRadius: BorderRadius.circular(8),
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: sticker.isCollected
                  ? _getStickerTypeColor(sticker.type).withOpacity(0.8)
                  : Colors.grey[300],
              borderRadius: BorderRadius.circular(8),
              border: Border.all(
                color: sticker.isCollected
                    ? _getStickerTypeColor(sticker.type)
                    : Colors.grey[400]!,
                width: 1.5,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 2,
                  offset: const Offset(0, 1),
                ),
              ],
            ),
            child: Center(
              child: Text(
                sticker.number.toString(),
                style: TextStyle(
                  color: sticker.isCollected ? Colors.white : Colors.black87,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          if (sticker.isCollected)
            Positioned(
              top: 4,
              right: 4,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
                padding: const EdgeInsets.all(2),
                child: const Icon(
                  Icons.check_circle,
                  color: Colors.green,
                  size: 16,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildSummary() {
    final collectedCount = stickers.where((s) => s.isCollected).length;
    final totalCount = stickers.length;
    final percentage =
        totalCount > 0 ? (collectedCount / totalCount * 100).toInt() : 0;

    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: totalCount > 0 ? collectedCount / totalCount : 0,
                  backgroundColor: Colors.grey[200],
                  valueColor: const AlwaysStoppedAnimation<Color>(Colors.blue),
                  strokeWidth: 8,
                ),
              ),
              Text(
                '$percentage%',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Progresso do Álbum',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey[800],
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Você já coletou $collectedCount de $totalCount figurinhas',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
