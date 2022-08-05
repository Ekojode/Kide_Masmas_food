import "package:flutter/material.dart";
import "package:responsive_sizer/responsive_sizer.dart";

import './on_boarding_2.dart';

import '../global/app_text_style.dart';

import "../widgets/action_button.dart";
import '../widgets/text_widget.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({Key? key}) : super(key: key);

  static const routeName = "/onboarding1";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 60.h,
            child: ClipRRect(
              child: Image.asset("assets/images/Illustartion.png"),
            ),
          ),
          Container(
            height: 20.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextWidget(
                  text: "Find your Comfort Food here",
                  textStyle: textStyle1,
                ),
                TextWidget(
                  text:
                      "Here you can find a chef or dish for every taste and color. Enjoy!",
                  textStyle: textStyle2,
                ),
              ],
            ),
          ),
          SizedBox(height: 4.h),
          ActionButton(
              height: 8.h,
              width: 30.w,
              onTap: () {
                Navigator.of(context)
                    .pushReplacementNamed(OnBoarding2.routeName);
              },
              text: "Next"),
          SizedBox(height: 8.h),
        ],
      ),
    );
  }
}
