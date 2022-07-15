import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../global/app_text_style.dart';

import '../widgets/button.dart';
import '../widgets/text_widget.dart';

class OnBoarding2 extends StatelessWidget {
  const OnBoarding2({Key? key}) : super(key: key);

  static const routeName = "/onBoarding2";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
            child: ClipRRect(
              child: Image.asset("assets/images/food_illistration.png"),
            ),
          ),
          Container(
            height: 20.h,
            margin: EdgeInsets.symmetric(horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget(
                  text: "Food Ninja is Where Your Comfort Food Lives",
                  textStyle: textStyle1,
                ),
                TextWidget(
                  text:
                      "Enjoy a fast and smooth food delivery at your doorstep",
                  textStyle: textStyle2,
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          Button(
            text: "Next",
            height: 8.h,
            width: 30.w,
            onTap: () {
              Navigator.of(context).pushReplacementNamed(OnBoarding2.routeName);
            },
          ),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
