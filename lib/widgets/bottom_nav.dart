import 'package:flutter/material.dart';
import 'package:masmas_food/global/app_color.dart';
import 'package:masmas_food/widgets/badge.dart';
import 'package:provider/provider.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../provider/cart.dart';

class BottomNavBar extends StatelessWidget {
  final int currentIndex;
  final Function(int) onTap;
  const BottomNavBar(
      {Key? key, required this.currentIndex, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: ClipRRect(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20), topRight: Radius.circular(20)),
        child: BottomNavyBar(
          containerHeight: 8.h,
          selectedIndex: currentIndex,
          showElevation: true,
          itemCornerRadius: 24,
          onItemSelected: onTap,
          curve: Curves.easeIn,
          items: <BottomNavyBarItem>[
            BottomNavyBarItem(
              icon: const Icon(Icons.home),
              title: const Text('Home'),
              activeColor: greenColor1,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
                icon: const Icon(Icons.favorite),
                title: const Text("Favourites"),
                activeColor: Colors.red,
                textAlign: TextAlign.center),
            BottomNavyBarItem(
              icon: Consumer<Cart>(
                builder: (BuildContext context, cart, Widget? child) {
                  return Badge(
                    value: cart.cartQuantity.toString(),
                    color: greenColor1,
                    child: const Icon(
                      Icons.shopping_cart,
                      size: 30,
                    ),
                  );
                },
              ),
              title: const Text(
                'Cart',
              ),
              activeColor: Colors.pink,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.notifications),
              title: const Text('Notifications'),
              activeColor: Colors.blue,
              textAlign: TextAlign.center,
            ),
            BottomNavyBarItem(
              icon: const Icon(Icons.people),
              title: const Text('Profile'),
              activeColor: Colors.purpleAccent,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
