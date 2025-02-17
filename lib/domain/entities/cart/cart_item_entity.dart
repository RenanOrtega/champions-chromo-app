import 'package:freezed_annotation/freezed_annotation.dart';

// Estas linhas são necessárias para gerar os arquivos
part 'cart_item_entity.freezed.dart';
part 'cart_item_entity.g.dart';

// Decorador @freezed para indicar que esta classe usará o freezed
@freezed
class CartItem with _$CartItem {
  // O construtor factory é onde definimos os campos
  const factory CartItem({
    required String id,
    required String albumName,
    required String stickerNumber,
    required String type,
    required double price,
    @Default(1) int quantity, // @Default define um valor padrão
  }) = _CartItem; // = _CartItem é necessário para o freezed

  // Este construtor factory é necessário para serialização JSON
  factory CartItem.fromJson(Map<String, dynamic> json) =>
      _$CartItemFromJson(json);
}
