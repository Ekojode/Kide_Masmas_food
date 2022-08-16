import 'package:flutter/material.dart';
import 'package:masmas_food/models/restaurant.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/restaurant_widget.dart';

class RestaurantGrid extends StatelessWidget {
  final List<Restaurant> restaurants;
  const RestaurantGrid({Key? key, required this.restaurants}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28.h,
      child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          // gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          //     maxCrossAxisExtent: 200,
          //     //      crossAxisSpacing: 5.h,
          //     mainAxisSpacing: 2.h,
          //     childAspectRatio: 2 / 3),
          itemCount: restaurants.length,
          itemBuilder: (ctx, i) {
            return RestaurantWidget(
              restaurant: restaurants[i],
            );
            
          }),
    );
  }
}
