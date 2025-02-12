class CartItem {
  final String id;
  final int stickerNumber;
  final String type;
  final String albumName;
  final double price;
  int quantity;

  CartItem({
    required this.id,
    required this.stickerNumber,
    required this.type,
    required this.albumName,
    required this.price,
    this.quantity = 1,
  });
}
