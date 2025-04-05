import 'package:champions_chromo_app/constants/route_constants.dart';
import 'package:champions_chromo_app/domain/entities/album_entity.dart' show Album;
import 'package:champions_chromo_app/domain/entities/cart/cart_item_entity.dart';
import 'package:champions_chromo_app/domain/entities/sticker_collection_entity.dart';
import 'package:champions_chromo_app/domain/entities/sticker_entity.dart';
import 'package:champions_chromo_app/domain/enums/operation_type.dart';
import 'package:champions_chromo_app/presentation/pages/cart/components/cart_icon_button.dart';
import 'package:champions_chromo_app/presentation/providers/album/album_state_provider.dart';
import 'package:champions_chromo_app/presentation/providers/cart/notifiers/cart_notifier.dart';
import 'package:champions_chromo_app/presentation/providers/sticker_collection/sticker_state_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StickerCollectionPage extends ConsumerStatefulWidget {
  final String albumId;
  final String schoolId;

  const StickerCollectionPage({
    super.key,
    required this.albumId,
    required this.schoolId,
  });

  @override
  ConsumerState<StickerCollectionPage> createState() => _StickerCollectionPageState();
}

class _StickerCollectionPageState extends ConsumerState<StickerCollectionPage> {
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _loadData();
    });
  }

  Future<void> _loadData() async {
    try {
      setState(() {
        _isLoading = true;
        _errorMessage = null;
      });

      // Carrega o álbum e a coleção de figurinhas simultaneamente
      await Future.wait([
        ref.read(albumProvider.notifier).getAlbumById(widget.albumId),
        ref.read(stickerCollectionProvider.notifier).getByUserId(),
      ]);
    } catch (error) {
      setState(() {
        _errorMessage = 'Erro ao carregar dados: $error';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final albumState = ref.watch(albumProvider);
    final stickerCollectionState = ref.watch(stickerCollectionProvider);
    
    // Handle loading and error states
    if (_isLoading) {
      return _buildScaffoldWithLoading();
    }
    
    if (_errorMessage != null || albumState.error != null || stickerCollectionState.error != null) {
      return _buildScaffoldWithError(_errorMessage ?? albumState.error?.toString() ?? stickerCollectionState.error.toString());
    }

    final album = albumState.value;
    if (album == null) {
      return _buildScaffoldWithError("Álbum não encontrado");
    }

    // Process stickers data
    final userAlbumData = _getUserAlbumData(album.id, stickerCollectionState.value);
    final stickersByType = _organizeStickersByType(album, userAlbumData);
    
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: Column(
        children: [
          _buildHeader(album.name),
          Expanded(
            child: _buildStickerContent(stickersByType),
          ),
          _buildSummary(stickersByType),
        ],
      ),
    );
  }

  Widget _buildScaffoldWithLoading() {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            _buildSimpleHeader(),
            const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildScaffoldWithError(String? errorMessage) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Column(
          children: [
            _buildSimpleHeader(),
            Expanded(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.error_outline, size: 48, color: Colors.red),
                    const SizedBox(height: 16),
                    Text(
                      errorMessage ?? "Ocorreu um erro",
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      onPressed: _loadData,
                      child: const Text("Tentar novamente"),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSimpleHeader() {
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
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => context.go(
                '${RouteConstants.albums}?schoolId=${widget.schoolId}'),
          ),
          const Expanded(
            child: Text(
              "Álbum de Figurinhas",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          const CartIconButton(Colors.white),
        ],
      ),
    );
  }

  Widget _buildHeader(String albumName) {
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
                  onPressed: () => context.go(
                      '${RouteConstants.albums}?schoolId=${widget.schoolId}'),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      albumName,
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
    );
  }

  Widget _buildStickerContent(Map<StickerType, List<Sticker>> stickersByType) {
    if (stickersByType.isEmpty) {
      return const Center(child: Text('Sem figurinhas disponíveis'));
    }

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        if (stickersByType.containsKey(StickerType.comum)) ...[
          _buildStickerSection('Comuns', StickerType.comum, stickersByType[StickerType.comum]!),
          const SizedBox(height: 24),
        ],
        if (stickersByType.containsKey(StickerType.quadro)) ...[
          _buildStickerSection('Quadro', StickerType.quadro, stickersByType[StickerType.quadro]!),
          const SizedBox(height: 24),
        ],
        if (stickersByType.containsKey(StickerType.legends)) ...[
          _buildStickerSection('Legends', StickerType.legends, stickersByType[StickerType.legends]!),
          const SizedBox(height: 24),
        ],
        if (stickersByType.containsKey(StickerType.a4)) ...[
          _buildStickerSection('A4', StickerType.a4, stickersByType[StickerType.a4]!),
          const SizedBox(height: 24),
        ],
      ],
    );
  }

  Widget _buildStickerSection(String title, StickerType type, List<Sticker> sectionStickers) {
    if (sectionStickers.isEmpty) return Container();

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
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Spacer(),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
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
              valueColor: AlwaysStoppedAnimation<Color>(_getStickerTypeColor(type)),
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
      onTap: () => _showStickerOptions(context, sticker),
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

  Widget _buildSummary(Map<StickerType, List<Sticker>> stickersByType) {
    // Flatten all stickers into a single list
    final allStickers = stickersByType.values.expand((stickers) => stickers).toList();
    final collectedCount = allStickers.where((s) => s.isCollected).length;
    final totalCount = allStickers.length;
    final percentage = totalCount > 0 ? (collectedCount / totalCount * 100).toInt() : 0;

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

  // ================ Utility Methods ================

  AlbumCollection? _getUserAlbumData(String albumId, StickerCollection? stickerCollection) {
    if (stickerCollection == null) return null;
    
    return stickerCollection.albums.firstWhere(
      (album) => album.albumId == albumId,
      orElse: () => AlbumCollection(
        albumId: albumId,
        ownedCommonStickers: [],
        ownedFrameStickers: [],
        ownedLegendStickers: [],
        ownedA4Stickers: [],
      ),
    );
  }

  Map<StickerType, List<Sticker>> _organizeStickersByType(Album album, AlbumCollection? userAlbumData) {
    final Map<StickerType, List<Sticker>> result = {};

    // Add common stickers
    if (album.commonStickers.isNotEmpty) {
      result[StickerType.comum] = album.commonStickers.map((stickerInfo) {
        final isCollected = userAlbumData?.ownedCommonStickers.contains(stickerInfo.number) ?? false;
        return Sticker(
          id: '${album.id}_${stickerInfo.number}',
          number: stickerInfo.number,
          type: StickerType.comum,
          isCollected: isCollected,
          price: 1.0,
        );
      }).toList();
    }

    // Add frame stickers
    if (album.frameStickers.isNotEmpty) {
      result[StickerType.quadro] = album.frameStickers.map((stickerInfo) {
        final isCollected = userAlbumData?.ownedFrameStickers.contains(stickerInfo.number) ?? false;
        return Sticker(
          id: '${album.id}_${stickerInfo.number}',
          number: stickerInfo.number,
          type: StickerType.quadro,
          isCollected: isCollected,
          price: 1.0,
        );
      }).toList();
    }

    // Add legend stickers
    if (album.legendStickers.isNotEmpty) {
      result[StickerType.legends] = album.legendStickers.map((stickerInfo) {
        final isCollected = userAlbumData?.ownedLegendStickers.contains(stickerInfo.number) ?? false;
        return Sticker(
          id: '${album.id}_${stickerInfo.number}',
          number: stickerInfo.number,
          type: StickerType.legends,
          isCollected: isCollected,
          price: 1.0,
        );
      }).toList();
    }

    // Add A4 stickers
    if (album.a4Stickers.isNotEmpty) {
      result[StickerType.a4] = album.a4Stickers.map((stickerInfo) {
        final isCollected = userAlbumData?.ownedA4Stickers.contains(stickerInfo.number) ?? false;
        return Sticker(
          id: '${album.id}_${stickerInfo.number}',
          number: stickerInfo.number,
          type: StickerType.a4,
          isCollected: isCollected,
          price: 1.0,
        );
      }).toList();
    }

    return result;
  }

  void _showStickerOptions(BuildContext context, Sticker sticker) {
    final albumState = ref.read(albumProvider);
    final album = albumState.value;
    
    if (album == null) return;

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
                        color: _getStickerTypeColor(sticker.type),
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
                  onPressed: () => _addToCart(context, sticker, album.name),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _updateStickerCollection(Sticker sticker, OperationType operation) async {
    try {
      await ref.read(stickerCollectionProvider.notifier).updateStickerCollection(
          widget.albumId, sticker.number.toString(), sticker.type, operation);
      
      // Reload data to reflect changes
      await _loadData();
      
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(operation == OperationType.add 
            ? 'Figurinha marcada como obtida!' 
            : 'Figurinha desmarcada!'),
          backgroundColor: operation == OperationType.add ? Colors.green : Colors.blue,
          behavior: SnackBarBehavior.floating,
        ),
      );
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao atualizar coleção: $error'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _addToCart(BuildContext context, Sticker sticker, String albumName) {
    ref.read(cartProvider.notifier).addItem(
      CartItem(
        id: sticker.id,
        stickerNumber: sticker.number.toString(),
        type: _getStickerTypeName(sticker.type),
        albumName: albumName,
        price: sticker.price,
        quantity: 1,
      ),
    );
    
    Navigator.pop(context);
    
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: const Row(
          children: [
            Icon(Icons.check_circle, color: Colors.white),
            SizedBox(width: 8),
            Text('Figurinha adicionada ao carrinho'),
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
}