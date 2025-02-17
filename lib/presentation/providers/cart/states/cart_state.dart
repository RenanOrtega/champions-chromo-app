import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:champions_chromo_app/domain/entities/cart/cart_item_entity.dart';

part 'cart_state.freezed.dart';
part 'cart_state.g.dart';

@freezed
class CartState with _$CartState {
  const factory CartState({
    @Default([]) List<CartItem> items,
  }) = _CartState;

  factory CartState.fromJson(Map<String, dynamic> json) =>
      _$CartStateFromJson(json);
}
