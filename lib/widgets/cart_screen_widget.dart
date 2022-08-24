import 'package:flutter/material.dart';
import 'cart_grid.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

class CartScreenWidget extends StatelessWidget {
  const CartScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    return Column(
      children: [
        const CartGrid(),
        ElevatedButton(
            onPressed: () {
              cartProvider.clearCart();
            },
            child: const Text("child"))
      ],
    );
  }
}
