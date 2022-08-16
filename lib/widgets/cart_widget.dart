import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CartWidget extends StatelessWidget {
  final String menuTitle;
  final String menuImage;
  final double menuPrice;
  final int menuQuantity;
  final String restaurantTitle;
  final VoidCallback cartIncrement;
  final VoidCallback cartDecrement;
  const CartWidget(
      {Key? key,
      required this.menuTitle,
      required this.menuImage,
      required this.menuPrice,
      required this.restaurantTitle,
      required this.menuQuantity,
      required this.cartIncrement,
      required this.cartDecrement})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Container(
            height: 10.h,
            width: 10.w,
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15)),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                menuImage,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            child: Column(
              children: [
                Text(menuTitle),
                Text(restaurantTitle),
                Text("$menuPrice"),
              ],
            ),
          ),
          IconButton(onPressed: cartDecrement, icon: const Icon(Icons.remove)),
          Text("$menuQuantity"),
          IconButton(onPressed: cartIncrement, icon: const Icon(Icons.add))
        ],
      ),
    );
  }
}
