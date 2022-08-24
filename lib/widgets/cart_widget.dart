import 'package:flutter/material.dart';
import 'package:masmas_food/global/app_color.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

class CartWidget extends StatelessWidget {
  final String menuTitle;
  final String menuImage;
  final double menuPrice;
  final int menuQuantity;
  final String restaurantTitle;
  final VoidCallback cartIncrement;
  final VoidCallback cartDecrement;

  const CartWidget({
    Key? key,
    required this.menuTitle,
    required this.menuImage,
    required this.menuPrice,
    required this.restaurantTitle,
    required this.menuQuantity,
    required this.cartIncrement,
    required this.cartDecrement,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 1.5.w),
      child: Card(
        color: primaryColor,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
        child: Column(
          children: [
            SizedBox(height: 1.5.h),
            Row(
              children: [
                Container(
                  margin: EdgeInsets.all(0.5.h),
                  height: 12.h,
                  width: 25.w,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(20)),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.network(
                      menuImage,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 2.w),
                SizedBox(
                  height: 12.h,
                  width: 36.w,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        menuTitle,
                        style: TextStyle(
                            fontSize: 17.sp, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        restaurantTitle,
                        style: TextStyle(fontSize: 16.sp, color: Colors.grey),
                      ),
                      Text(
                        "₦ ${menuPrice.toStringAsFixed(2)}",
                        style: TextStyle(
                            color: greenColor2,
                            fontWeight: FontWeight.bold,
                            fontSize: 19.sp),
                      ),
                    ],
                  ),
                ),
                const Spacer(),
                IconButton(
                    onPressed: cartDecrement, icon: const Icon(Icons.remove)),
                Text("$menuQuantity"),
                IconButton(
                  onPressed: cartIncrement,
                  //  label: Text("data"),
                  icon: const Icon(
                    Icons.add,
                    //     color: primaryColor,
                  ),
                ),
                const Spacer()
              ],
            ),
            SizedBox(height: 1.5.h)
          ],
        ),
      ),
    );
  }
}
