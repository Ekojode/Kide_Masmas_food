import 'package:flutter/material.dart';
import 'package:masmas_food/global/app_text_style.dart';
import 'package:masmas_food/models/restaurant.dart';
import 'package:masmas_food/widgets/space_widget.dart';
import 'package:masmas_food/widgets/text_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:provider/provider.dart';

import '../global/app_color.dart';

class MenuDetailScreen extends StatelessWidget {
  const MenuDetailScreen({Key? key}) : super(key: key);

  static const routeName = "/menuDetailScreen";

  @override
  Widget build(BuildContext context) {
    final menuId = ModalRoute.of(context)!.settings.arguments as String;
    final provider = Provider.of<Restaurants>(context);
    print('passed');
    // final resto = provider.findMenuRestaurant(menuId);
    final double topSpacing = MediaQuery.of(context).padding.top;

    final menu = provider.findMenuById(menuId);
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
              // title: Text(
              //   menu.title,
              //   style: const TextStyle(color: Colors.black),
              // ),
              background: Column(
                children: [
                  SizedBox(height: topSpacing),
                  Hero(
                    tag: menu.id,
                    child: Image.network(
                      menu.img,
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                // const SpaceWidget(),
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
                TextWidget(text: menu.title, textStyle: textStyle1),
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
          onPressed: (() {}),
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
