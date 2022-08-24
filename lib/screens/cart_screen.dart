import 'package:flutter/material.dart';
import '../global/app_color.dart';
import '../widgets/cart_screen_widget.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = "/cartScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: greenColor1,
        title: const Text("Cart"),
        centerTitle: true,
      ),
      body: const CartScreenWidget(),
    );
  }
}
