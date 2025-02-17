import 'package:champions_chromo_app/domain/entities/cart/cart_item_entity.dart';
import 'package:champions_chromo_app/presentation/providers/cart/states/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier();
});

class CartNotifier extends StateNotifier<CartState> {
  CartNotifier() : super(const CartState());

  void addItem(CartItem item) {
    final items = [...state.items];
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

    state = state.copyWith(items: items);
  }

  void removeItem(String id, String albumName) {
    final items = state.items
        .where((item) => !(item.id == id && item.albumName == albumName))
        .toList();
    state = state.copyWith(items: items);
  }

  void increaseQuantity(String id) {
    final items = [...state.items];
    final index = items.indexWhere((item) => item.id == id);
    if (index >= 0) {
      items[index] = items[index].copyWith(
        quantity: items[index].quantity + 1,
      );
      state = state.copyWith(items: items);
    }
  }

  void decreaseQuantity(String id) {
    final items = [...state.items];
    final index = items.indexWhere((item) => item.id == id);
    if (index >= 0 && items[index].quantity > 1) {
      items[index] = items[index].copyWith(
        quantity: items[index].quantity - 1,
      );
      state = state.copyWith(items: items);
    }
  }
}
