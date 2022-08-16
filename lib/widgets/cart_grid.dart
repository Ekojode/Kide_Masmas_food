import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';
import '../widgets/cart_widget.dart';

class CartGrid extends StatelessWidget {
  const CartGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    final cart = cartProvider.cartItems;
    final cartList = cart.values.toList();
    return ListView.builder(
        itemCount: cartList.length,
        itemBuilder: (context, i) {
          return CartWidget(
            menuTitle: cartList[i].title,
            menuImage: cartList[i].imgUrl,
            menuPrice: cartList[i].price,
            restaurantTitle: cartList[i].restaurant.name,
            menuQuantity: cartList[i].quantity,
            cartIncrement: () {
              cartProvider.cartItemIncrement(cartList[i].id);
            },
            cartDecrement: () {
              cartProvider.cartItemDecrement(cartList[i].id);
            },
          );
        });
  }
}
