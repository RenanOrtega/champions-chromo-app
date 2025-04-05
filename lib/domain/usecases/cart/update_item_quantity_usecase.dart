import 'package:champions_chromo_app/domain/entities/cart/cart_item_entity.dart';

class UpdateItemQuantityUseCase {
  final List<CartItem> _items;

  UpdateItemQuantityUseCase(this._items);

  List<CartItem> execute(String id, {required bool increase}) {
    final items = [..._items];
    final index = items.indexWhere((item) => item.id == id);
    
    if (index >= 0) {
      if (increase) {
        items[index] = items[index].copyWith(
          quantity: items[index].quantity + 1,
        );
      } else if (items[index].quantity > 1) {
        items[index] = items[index].copyWith(
          quantity: items[index].quantity - 1,
        );
      }
    }
    
    return items;
  }
} 