import 'package:champions_chromo_app/domain/entities/cart/cart_item_entity.dart';
import 'package:champions_chromo_app/presentation/providers/cart/cart_usecase_provider.dart';
import 'package:champions_chromo_app/presentation/providers/cart/states/cart_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cartProvider = StateNotifierProvider<CartNotifier, CartState>((ref) {
  return CartNotifier(ref);
});

class CartNotifier extends StateNotifier<CartState> {
  final Ref _ref;

  CartNotifier(this._ref) : super(const CartState());

  void addItem(CartItem item) {
    final addItemUseCase = _ref.read(addItemToCartUseCaseProvider(state.items));
    final newItems = addItemUseCase.execute(item);
    state = state.copyWith(items: newItems);
  }

  void removeItem(String id, String albumName) {
    final removeItemUseCase = _ref.read(removeItemFromCartUseCaseProvider(state.items));
    final newItems = removeItemUseCase.execute(id, albumName);
    state = state.copyWith(items: newItems);
  }

  void increaseQuantity(String id) {
    final updateQuantityUseCase = _ref.read(updateItemQuantityUseCaseProvider(state.items));
    final newItems = updateQuantityUseCase.execute(id, increase: true);
    state = state.copyWith(items: newItems);
  }

  void decreaseQuantity(String id) {
    final updateQuantityUseCase = _ref.read(updateItemQuantityUseCaseProvider(state.items));
    final newItems = updateQuantityUseCase.execute(id, increase: false);
    state = state.copyWith(items: newItems);
  }

  void clearCart() {
    state = state.copyWith(items: []);
  }
}
