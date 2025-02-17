import 'package:champions_chromo_app/presentation/pages/cart/components/cart_footer.dart';
import 'package:champions_chromo_app/presentation/pages/cart/components/cart_item_card.dart';
import 'package:champions_chromo_app/presentation/providers/cart/notifiers/cart_notifier.dart';
import 'package:champions_chromo_app/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class CartPage extends ConsumerWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cart = ref.watch(cartProvider);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            context.go(AppRoutes
                .schools); // TODO: Fazer voltar par aultima pagina acessada.
          },
        ),
        title: const Text(
          'Carrinho',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Text('Seu carrinho está vazio.'),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.all(16),
                    itemCount: cart.items.length,
                    itemBuilder: (context, index) =>
                        CartItemCard(item: cart.items[index]),
                  ),
                ),
                CartFooter(),
              ],
            ),
    );
  }
}
