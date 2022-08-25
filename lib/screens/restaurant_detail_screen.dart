import 'package:flutter/material.dart';
import 'package:masmas_food/global/app_color.dart';
import 'package:masmas_food/global/app_text_style.dart';
import 'package:masmas_food/models/menu.dart';
import 'package:masmas_food/models/restaurant.dart';
import 'package:masmas_food/widgets/menu_grid.dart';
import 'package:masmas_food/widgets/row_text_button.dart';
import 'package:masmas_food/widgets/space_widget.dart';
import 'package:masmas_food/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'googlemap_screen.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);
  static const routeName = "/RestaurantDetailScreen";

  @override
  Widget build(BuildContext context) {
    final restaurantId = ModalRoute.of(context)!.settings.arguments as String;
    final provider = Provider.of<Restaurants>(context);
    final restaurant = provider.findRestaurantById(restaurantId);
    final double topSpacing = MediaQuery.of(context).padding.top;
    print('passed');
    return Scaffold(
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: orangeColor1,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          pinned: true,
          expandedHeight: 40.h,
          flexibleSpace: FlexibleSpaceBar(
            centerTitle: true,
            background: Column(
              children: [
                SizedBox(
                  height: topSpacing,
                ),
                Hero(
                  tag: restaurant.id,
                  child: Image.network(
                    restaurant.img,
                    fit: BoxFit.cover,
                    //pixel overflow
                    height: 40.h,
                  ),
                )
              ],
            ),
          ),
        ),
        SliverList(
          delegate: SliverChildListDelegate(
            [
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  children: [
                    Text(
                      "Popular",
                      style: TextStyle(
                          fontSize: 20.sp,
                          color: greenColor1,
                          fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.location_on,
                      color: greenColor1,
                      size: 30,
                    ),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.favorite_outline_outlined,
                          size: 30,
                        ))
                  ],
                ),
              ),
              TextWidget(text: restaurant.name, textStyle: textStyle1),
              GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, GoogleMapScreen.routeName);
                  },
                  child: const Text('Map')),
              Row(
                children: [
                  const Icon(
                    Icons.location_on,
                    color: greenColor1,
                    size: 30,
                  ),
                  TextWidget(
                      text: "${restaurant.distance} km", textStyle: textStyle8),
                  const Icon(
                    Icons.star_half_outlined,
                    color: greenColor1,
                    size: 30,
                  ),
                  TextWidget(
                      text: "${restaurant.rating} Rating",
                      textStyle: textStyle8),
                ],
              ),
              const SpaceWidget(),
              RowTextBtn(text: "Popular Menu", onPressed: () {}),
              const SpaceWidget(),
              // MenuGrid(menu: restaurant.menu),
              SizedBox(
                height: 28.h,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: restaurant.menu!.length,
                    // itemCount: 2,
                    itemBuilder: (ctx, i) {
                      return Container(
                        height: 28.h,
                        width: 45.w,
                        child: Card(
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(children: [
                            Image.network(restaurant.menu![i].img,
                                fit: BoxFit.cover),
                            const SpaceWidget(),
                            FittedBox(
                              child: Text(restaurant.menu![i].title),
                            ),
                            const SpaceWidget(),
                            Text("₦${restaurant.menu![i].price}")
                          ]),
                        ),
                      );
                    }),
              ),
              SizedBox(
                height: 200.h,
              )
            ],
          ),
        ),
      ],
    ));
  }
}
