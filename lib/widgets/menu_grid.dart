import 'package:flutter/material.dart';
import 'package:masmas_food/widgets/menu_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../models/menu.dart';

class MenuGrid extends StatelessWidget {
  final List<Menu> menu;
  const MenuGrid({Key? key, required this.menu}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30.h,
      child: ListView.builder(
          padding: EdgeInsets.zero,
          itemCount: menu.length,
          itemBuilder: (context, i) {
            return MenuWidget(menu: menu[i]);
          }),
    );
  }
}
