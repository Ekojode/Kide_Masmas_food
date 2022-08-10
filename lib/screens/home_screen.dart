import 'package:flutter/material.dart';

import 'package:masmas_food/widgets/menu_grid.dart';
import 'package:masmas_food/widgets/promo_card.dart';
import 'package:masmas_food/widgets/restaurant_grid.dart';
import 'package:masmas_food/widgets/search_widget.dart';

import '../models/restaurant.dart';

import 'package:provider/provider.dart';
import '../widgets/row_text_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    final restauruant = Provider.of<Restaurants>(context);
    final restaurants = restauruant.restaurants;
    final menus = restauruant.menu;
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SearcherWidget(),
            const PromoCard(),
            RowTextBtn(text: "Popular Restaurants", onPressed: () {}),
            RestaurantGrid(restaurants: restaurants),
            RowTextBtn(text: "Popular Menus", onPressed: () {}),
            MenuGrid(menu: menus)
          ],
        ),
      ),
    );
  }
}
