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
    // final resto = provider.findMenuRestaurant(menuId);

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
              background: Hero(
                tag: menu.id,
                child: Image.network(
                  menu.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                const SpaceWidget(),
                //     Text(resto!.name),
                ElevatedButton(
                    onPressed: () {
                      provider.findMenuBgyId(menuId);
                    },
                    child: const Text("Omoo")),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 8),
                  child: Row(
                    children: [
                      Text(
                        "Popular",
                        style: TextStyle(
                            fontSize: 18.sp,
                            color: greenColor1,
                            fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const Icon(
                        Icons.location_on,
                        color: greenColor1,
                      )
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
    );
  }
}