import 'package:flutter/material.dart';
import 'package:masmas_food/global/app_color.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../screens/menu_detail_screen.dart';

import '../models/menu.dart';

class MenuWidget extends StatelessWidget {
  final Menu menu;
  const MenuWidget({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 5,
      child: Column(
        children: [
          SizedBox(height: 1.h),
          ListTile(
            onTap: () {
              Navigator.pushNamed(
                context,
                MenuDetailScreen.routeName,
                arguments: menu.id,
              );
            },
            leading: Hero(
              tag: menu.id,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  menu.img,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: FittedBox(
              child: Text(
                menu.title,
                style: TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Text(menu.description),
            trailing: Text(
              "₦${menu.price}",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: yellowColor,
                  fontSize: 17.sp),
            ),
          ),
          SizedBox(height: 1.h),
        ],
      ),
    );
  }
}
