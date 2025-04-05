import 'package:champions_chromo_app/domain/entities/cart/cart_item_entity.dart';
import 'package:champions_chromo_app/domain/usecases/cart/add_item_to_cart_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/cart/remove_item_from_cart_usecase.dart';
import 'package:champions_chromo_app/domain/usecases/cart/update_item_quantity_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addItemToCartUseCaseProvider = Provider.family<AddItemToCartUseCase, List<CartItem>>((ref, items) {
  return AddItemToCartUseCase(items);
});

final removeItemFromCartUseCaseProvider = Provider.family<RemoveItemFromCartUseCase, List<CartItem>>((ref, items) {
  return RemoveItemFromCartUseCase(items);
});

final updateItemQuantityUseCaseProvider = Provider.family<UpdateItemQuantityUseCase, List<CartItem>>((ref, items) {
  return UpdateItemQuantityUseCase(items);
}); 