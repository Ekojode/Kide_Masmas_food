import 'package:flutter/material.dart';
import 'package:masmas_food/models/restaurant.dart';
import 'package:masmas_food/screens/restaurant_detail_screen.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class RestaurantWidget extends StatelessWidget {
  final Restaurant restaurant;
  const RestaurantWidget({Key? key, required this.restaurant})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //  margin: EdgeInsets.all(1.h),
      height: 28.h,
      width: 45.w,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Card(
        elevation: 4,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: GestureDetector(
          onTap: () {
            Navigator.pushNamed(
              context,
              RestaurantDetailScreen.routeName,
              arguments: restaurant.id,
            );
          },
          child: Column(
            children: [
              SizedBox(height: 1.h),
              SizedBox(
                  height: 18.h,
                  child: Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          // topLeft: Radius.circular(20),
                          // topRight: Radius.circular(20)
                          20),
                      child: Image.network(
                        restaurant.img,
                        fit: BoxFit.cover,
                      ),
                    ),
                  )),
              SizedBox(height: 1.h),
              FittedBox(
                child: Text(
                  restaurant.name,
                  style:
                      TextStyle(fontSize: 19.sp, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(height: 1.h),
              Text(
                "${restaurant.distance} mins",
                style: TextStyle(fontSize: 16.sp),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
