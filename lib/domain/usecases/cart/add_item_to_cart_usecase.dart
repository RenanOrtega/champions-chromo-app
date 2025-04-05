import 'package:champions_chromo_app/domain/entities/cart/cart_item_entity.dart';

class AddItemToCartUseCase {
  final List<CartItem> _items;

  AddItemToCartUseCase(this._items);

  List<CartItem> execute(CartItem item) {
    final items = [..._items];
    final existingIndex = items.indexWhere(
      (i) => i.id == item.id && i.albumName == item.albumName,
    );

    if (existingIndex >= 0) {
      items[existingIndex] = items[existingIndex].copyWith(
        quantity: items[existingIndex].quantity + 1,
      );
    } else {
      items.add(item);
    }

    return items;
  }
} 