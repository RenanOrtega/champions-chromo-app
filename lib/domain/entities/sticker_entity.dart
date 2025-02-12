enum StickerType {
  comum,
  quadro,
  legends,
  a4,
}

class Sticker {
  final String id;
  final int number;
  final StickerType type;
  bool isCollected;
  final double price;

  Sticker({
    required this.id,
    required this.number,
    required this.type,
    required this.isCollected,
    required this.price,
  });
}
