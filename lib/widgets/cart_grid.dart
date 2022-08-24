import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:lottie/lottie.dart';
import '../provider/cart.dart';
import '../widgets/cart_widget.dart';

class CartGrid extends StatelessWidget {
  const CartGrid({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<Cart>(context);
    final cart = cartProvider.cartItems;
    final cartList = cart.values.toList();
    final cartKeys = cart.keys.toList();
    return cartList.isEmpty
        ? SizedBox(
            height: 80.h,
            child: Center(
              child: SizedBox(
                  height: 40.h,
                  child: Lottie.asset("assets/lotties/42176-empty-cart.json")),
            ),
          )
        : SizedBox(
            height: 80.h,
            child: ListView.builder(
                itemCount: cartList.length,
                itemBuilder: (context, i) {
                  return CartWidget(
                    menuTitle: cartList[i].title,
                    menuImage: cartList[i].imgUrl,
                    menuPrice: cartList[i].price,
                    restaurantTitle: cartList[i].restaurant.name,
                    menuQuantity: cartList[i].quantity,
                    cartIncrement: () {
                      cartProvider.cartItemIncrement(cartKeys[i]);
                    },
                    cartDecrement: () {
                      if (cartList[i].quantity < 2) {
                        return;
                      }
                      cartProvider.cartItemDecrement(cartKeys[i]);
                    },
                  );
                }),
          );
  }
}
