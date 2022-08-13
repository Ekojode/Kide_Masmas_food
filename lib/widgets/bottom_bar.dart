import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../screens/home_screen.dart';
import '../screens/cart_screen.dart';
import '../screens/message_screen.dart';
import '../screens/profile_screen.dart';

class BottomVBar extends StatelessWidget {
  final int pageNum;
  const BottomVBar({Key? key, required this.pageNum}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 7.h,
        width: double.infinity,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15),
            topRight: Radius.circular(15),
          ),
        ),
        child: Row(
          children: [
            pageNum == 1
                ? buildIconRow(Icons.home, "Home", Colors.red)
                : buildIcon(
                    Icons.home, Colors.red, context, HomeScreen.routeName),
            pageNum == 2
                ? buildIconRow(Icons.shopping_cart, "Cart", Colors.pink)
                : buildIcon(Icons.shopping_cart, Colors.pink, context,
                    CartScreen.routeName),
            pageNum == 3
                ? buildIconRow(Icons.message, "Messages", Colors.blue)
                : buildIcon(Icons.message, Colors.blue, context,
                    MessageScreen.routeName),
            pageNum == 4
                ? buildIconRow(Icons.person, "Profile", Colors.purpleAccent)
                : buildIcon(Icons.person, Colors.purple, context,
                    ProfileScreen.routeName)
          ],
        ));
  }
}

Widget buildIconRow(IconData icon, String text, Color colors) {
  return Container(
    decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: colors.withOpacity(0.15)),
    width: 35.w,
    height: 5.5.h,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(width: 1.w),
        Icon(
          icon,
          color: colors,
          size: 28,
        ),
        const Spacer(),
        Text(
          text,
          style: TextStyle(
              fontSize: 17.sp, fontWeight: FontWeight.bold, color: colors),
        ),
        const Spacer()
      ],
    ),
  );
}

Widget buildIcon(
    IconData icon, Color colors, BuildContext context, String routeName) {
  return Center(
      child: SizedBox(
    width: 20.w,
    height: 5.5.h,
    child: IconButton(
      onPressed: (() {
        Navigator.of(context).pushNamed(routeName);
      }),
      icon: Icon(
        icon,
        size: 24,
        color: colors,
      ),
    ),
  ));
}
