import 'package:flutter/material.dart';
import 'package:masmas_food/widgets/restaurant_grid.dart';
import 'package:masmas_food/widgets/restaurant_widget.dart';
import '../models/restaurant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../global/app_color.dart';
import 'package:provider/provider.dart';
import '../widgets/row_text_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home";

  @override
  Widget build(BuildContext context) {
    final Restaurant testRestaurant = Restaurant(
        name: "Test",
        img:
            "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Burger_King_logo_%281999%29.svg/2024px-Burger_King_logo_%281999%29.svg.png",
        distance: 80);
    final restaurants = Provider.of<Restaurants>(context).restaurants;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                  decoration: BoxDecoration(
                      color: const Color(0xfffef6ed),
                      borderRadius: BorderRadius.circular(15)),
                  margin: const EdgeInsets.all(10),
                  child: const TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        icon: Icon(
                          Icons.search,
                          color: orangeColor1,
                          size: 30,
                        ),
                        hintText: "What do you want to order?"),
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 2, horizontal: 3),
                decoration: BoxDecoration(
                    color: const Color(0xfffef6ed),
                    borderRadius: BorderRadius.circular(10)),
                child: IconButton(
                  icon: const Icon(
                    Icons.tune,
                    color: orangeColor2,
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
          // SizedBox(height: 1.h),
          RowTextBtn(text: "Popular Restaurants", onPressed: () {}),
          RestaurantGrid(restaurants: restaurants),
          RowTextBtn(text: "Popular Menus", onPressed: () {}),
          RestaurantWidget(restaurant: testRestaurant)
        ],
      ),
    );
  }
}
