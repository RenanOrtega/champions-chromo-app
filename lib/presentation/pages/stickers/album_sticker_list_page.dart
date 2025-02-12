import 'package:champions_chromo_app/domain/entities/cart_item_entity.dart';
import 'package:champions_chromo_app/domain/entities/sticker_entity.dart';
import 'package:champions_chromo_app/presentation/pages/cart/cart_icon_button.dart';
import 'package:champions_chromo_app/presentation/pages/cart/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AlbumStickerListPage extends StatefulWidget {
  final String albumName;

  const AlbumStickerListPage({
    super.key,
    required this.albumName,
  });

  @override
  State<AlbumStickerListPage> createState() => _AlbumStickerListPageState();
}

class _AlbumStickerListPageState extends State<AlbumStickerListPage> {
  late List<Sticker> stickers;

  @override
  void initState() {
    super.initState();
    stickers = [
      // Comuns
      Sticker(
          id: '1',
          number: 1,
          type: StickerType.comum,
          isCollected: true,
          price: 1.00),
      Sticker(
          id: '2',
          number: 2,
          type: StickerType.comum,
          isCollected: false,
          price: 1.00),
      Sticker(
          id: '3',
          number: 3,
          type: StickerType.comum,
          isCollected: true,
          price: 1.00),
      Sticker(
          id: '1',
          number: 4,
          type: StickerType.comum,
          isCollected: true,
          price: 1.00),
      Sticker(
          id: '2',
          number: 5,
          type: StickerType.comum,
          isCollected: false,
          price: 1.00),
      Sticker(
          id: '3',
          number: 6,
          type: StickerType.comum,
          isCollected: true,
          price: 1.00),
      Sticker(
          id: '1',
          number: 7,
          type: StickerType.comum,
          isCollected: true,
          price: 1.00),
      Sticker(
          id: '2',
          number: 8,
          type: StickerType.comum,
          isCollected: false,
          price: 1.00),
      Sticker(
          id: '3',
          number: 9,
          type: StickerType.comum,
          isCollected: true,
          price: 1.00),
      // Quadro
      Sticker(
          id: '4',
          number: 10,
          type: StickerType.quadro,
          isCollected: false,
          price: 3.00),
      Sticker(
          id: '5',
          number: 11,
          type: StickerType.quadro,
          isCollected: true,
          price: 3.00),
      Sticker(
          id: '4',
          number: 12,
          type: StickerType.quadro,
          isCollected: false,
          price: 3.00),
      Sticker(
          id: '5',
          number: 13,
          type: StickerType.quadro,
          isCollected: true,
          price: 3.00),
      Sticker(
          id: '4',
          number: 14,
          type: StickerType.quadro,
          isCollected: false,
          price: 3.00),
      Sticker(
          id: '5',
          number: 15,
          type: StickerType.quadro,
          isCollected: true,
          price: 3.00),
      Sticker(
          id: '4',
          number: 16,
          type: StickerType.quadro,
          isCollected: false,
          price: 3.00),
      Sticker(
          id: '5',
          number: 17,
          type: StickerType.quadro,
          isCollected: true,
          price: 3.00),
      // Legends
      Sticker(
          id: '6',
          number: 18,
          type: StickerType.legends,
          isCollected: false,
          price: 4.00),
      Sticker(
          id: '7',
          number: 19,
          type: StickerType.legends,
          isCollected: true,
          price: 4.00),
      Sticker(
          id: '6',
          number: 20,
          type: StickerType.legends,
          isCollected: false,
          price: 4.00),
      Sticker(
          id: '7',
          number: 21,
          type: StickerType.legends,
          isCollected: true,
          price: 4.00),
      // A4
      Sticker(
          id: '8',
          number: 22,
          type: StickerType.a4,
          isCollected: false,
          price: 5.00),
      Sticker(
          id: '9',
          number: 23,
          type: StickerType.a4,
          isCollected: true,
          price: 5.00),
      Sticker(
          id: '8',
          number: 24,
          type: StickerType.a4,
          isCollected: false,
          price: 5.00),
      Sticker(
          id: '9',
          number: 25,
          type: StickerType.a4,
          isCollected: true,
          price: 5.00),
      Sticker(
          id: '8',
          number: 26,
          type: StickerType.a4,
          isCollected: false,
          price: 5.00),
      Sticker(
          id: '9',
          number: 27,
          type: StickerType.a4,
          isCollected: true,
          price: 5.00),
      Sticker(
          id: '8',
          number: 28,
          type: StickerType.a4,
          isCollected: false,
          price: 5.00),
      Sticker(
          id: '9',
          number: 29,
          type: StickerType.a4,
          isCollected: true,
          price: 5.00),
    ];
  }

  void _showStickerOptions(BuildContext context, Sticker sticker) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                leading: const Icon(Icons.check_circle_outline),
                title: const Text('Marcar como obtida'),
                enabled: !sticker.isCollected,
                onTap: () {
                  setState(() {
                    sticker.isCollected = true;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.remove_circle_outline),
                title: const Text('Desmarcar como obtida'),
                enabled: sticker.isCollected,
                onTap: () {
                  setState(() {
                    sticker.isCollected = false;
                  });
                  Navigator.pop(context);
                },
              ),
              ListTile(
                leading: const Icon(Icons.shopping_cart),
                title: const Text('Adicionar ao carrinho'),
                onTap: () {
                  final cart = context.read<CartProvider>();
                  cart.addItem(
                    CartItem(
                      id: sticker.id,
                      stickerNumber: sticker.number,
                      type: _getStickerTypeName(sticker.type),
                      albumName: widget.albumName,
                      price: sticker.price,
                    ),
                  );
                  Navigator.pop(context);
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Figurinha adicionada ao carrinho.'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                },
              )
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.albumName,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: const [
          CartIconButton(),
        ],
      ),
      body: Column(
        children: [
          const Divider(height: 1, thickness: 1),
          Expanded(
            child: ListView(
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
        ],
      ),
    );
  }

  Widget _buildStickerSection(String title, StickerType type) {
    final sectionStickers = stickers.where((s) => s.type == type).toList();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
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
    );
  }

  Widget _buildStickerItem(Sticker sticker) {
    return InkWell(
      onTap: () => _showStickerOptions(context, sticker),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(4),
          child: Container(
            decoration: BoxDecoration(
              color: sticker.isCollected ? Colors.green[400] : Colors.grey[400],
              borderRadius: BorderRadius.circular(2),
            ),
            child: Center(
              child: Text(
                sticker.number.toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
