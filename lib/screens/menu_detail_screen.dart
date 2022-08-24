import 'package:flutter/material.dart';

import 'package:masmas_food/models/restaurant.dart';
import 'package:masmas_food/screens/cart_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';
import '../provider/cart.dart';

import '../global/app_color.dart';
import '../widgets/badge.dart';

class MenuDetailScreen extends StatelessWidget {
  const MenuDetailScreen({Key? key}) : super(key: key);

  static const routeName = "/menuDetailScreen";

  @override
  Widget build(BuildContext context) {
    final menuId = ModalRoute.of(context)!.settings.arguments as String;
    final cart = Provider.of<Cart>(context);
    final provider = Provider.of<Restaurants>(context);
    final menu = provider.findMenuById(menuId);
    final restaurant = provider.findMenuRestaurant(menu);
    //final double topSpacing = MediaQuery.of(context).padding.top;
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
              // backgroundColor: Colors.green[900],
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, CartScreen.routeName);
                    },
                    icon: Consumer<Cart>(
                      builder: (BuildContext context, cart, Widget? child) {
                        return Badge(
                          value: cart.cartQuantity.toString(),
                          color: greenColor2,
                          child: const Icon(
                            Icons.shopping_cart,
                            size: 28,
                            color: orangeColor1,
                          ),
                        );
                      },
                    ),
                  ),
                )
              ],
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new,
                  color: orangeColor2,
                  size: 28,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              expandedHeight: 36.h,
              pinned: true,
              flexibleSpace: Stack(
                children: [
                  Positioned.fill(
                    child: Hero(
                      tag: menu.id,
                      child: Image.network(
                        menu.img,
                        fit: BoxFit.cover,
                        colorBlendMode: BlendMode.darken,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -6,
                    left: 0,
                    right: 0,
                    child: Container(
                      height: 7.h,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.vertical(
                          top: Radius.circular(25),
                        ),
                      ),
                    ),
                  )
                ],
              )),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            menu.title,
                            style: TextStyle(
                                fontSize: 18.sp, fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.location_on,
                              color: greenColor1,
                              size: 30,
                            ),
                          ),
                          Consumer<Restaurants>(
                            builder:
                                (BuildContext context, value, Widget? child) {
                              return IconButton(
                                onPressed: () {
                                  provider.switchMenuFavouriteStatus(menuId);
                                },
                                icon: Icon(
                                  value.menuStatus(menuId)
                                      ? Icons.favorite
                                      : Icons.favorite_border,
                                  size: 30,
                                  color: value.menuStatus(menuId)
                                      ? Colors.red
                                      : null,
                                ),
                              );
                            },
                            // child:
                          )
                        ],
                      ),
                      Row(
                        children: [Text(restaurant.name)],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 200.h,
                )
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            cart.addCartItem(menu, restaurant, context);
          },
          style: ElevatedButton.styleFrom(
              primary: greenColor1, minimumSize: Size(double.infinity, 7.h)),
          child: const Text(
            "Add to Cart",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
