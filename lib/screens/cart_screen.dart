import 'package:flutter/material.dart';
import '../widgets/cart_grid.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = "/cartScreen";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Expanded(child: CartGrid()),
        const Spacer(),
        ElevatedButton(
            onPressed: () {}, child: const Text("Proceed to Check Out"))
      ],
    );
  }
}
