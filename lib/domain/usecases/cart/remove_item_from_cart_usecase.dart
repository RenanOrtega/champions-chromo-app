import 'package:champions_chromo_app/domain/entities/cart/cart_item_entity.dart';

class RemoveItemFromCartUseCase {
  final List<CartItem> _items;

  RemoveItemFromCartUseCase(this._items);

  List<CartItem> execute(String id, String albumName) {
    return _items
        .where((item) => !(item.id == id && item.albumName == albumName))
        .toList();
  }
} 