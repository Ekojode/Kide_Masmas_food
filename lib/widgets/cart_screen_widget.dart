import 'package:flutter/material.dart';
import 'cart_grid.dart';

class CartScreenWidget extends StatelessWidget {
  const CartScreenWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const CartGrid(),
        ElevatedButton(onPressed: () {}, child: const Text("child"))
      ],
    );
  }
}
