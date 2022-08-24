import 'package:flutter/material.dart';
import 'package:masmas_food/global/app_color.dart';
import 'package:masmas_food/global/app_text_style.dart';
import 'package:masmas_food/models/restaurant.dart';
import 'package:masmas_food/widgets/row_text_button.dart';
import 'package:masmas_food/widgets/space_widget.dart';
import 'package:masmas_food/widgets/text_widget.dart';
import 'package:provider/provider.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RestaurantDetailScreen extends StatelessWidget {
  const RestaurantDetailScreen({Key? key}) : super(key: key);
  static const routeName = "/RestaurantDetailScreen";

  @override
  Widget build(BuildContext context) {
    final restaurantId = ModalRoute.of(context)!.settings.arguments as String;
    final provider = Provider.of<Restaurants>(context);
    final restaurant = provider.findRestaurantById(restaurantId);

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new,
                color: greenColor1,
                size: 30,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            pinned: true,
            expandedHeight: 36.h,
            flexibleSpace: Stack(
              children: [
                //
                Positioned.fill(
                  child: Hero(
                    tag: restaurantId,
                    child: Image.network(
                      restaurant.img,
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
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      color: greenColor1,
                      size: 30,
                    ),
                    TextWidget(
                        text: "${restaurant.distance} km",
                        textStyle: textStyle8),
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
                  child: restaurant.menu == null
                      ? const Center(
                          child: Text("No menu in restaurant yet"),
                        )
                      : ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          scrollDirection: Axis.horizontal,
                          itemCount: restaurant.menu!.length,
                          // itemCount: 2,
                          itemBuilder: (ctx, i) {
                            return SizedBox(
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
      ),
    );
  }
}
