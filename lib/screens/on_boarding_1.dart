import "package:flutter/material.dart";
import "package:responsive_sizer/responsive_sizer.dart";

import '../global/app_text_style.dart';

import '../widgets/text_widget.dart';

class OnBoarding1 extends StatelessWidget {
  const OnBoarding1({Key? key}) : super(key: key);

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
            height: 18.h,
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Find your Comfort Food here",
                  style:
                      TextStyle(fontWeight: FontWeight.bold, fontSize: 22.sp),
                  textAlign: TextAlign.center,
                ),
                TextWidget(text: "Find", textStyle: texttheme1),
                Text(
                  "Here you can find a chef or dish for every taste and color. Enjoy!",
                  style: TextStyle(fontSize: 16.sp),
                  textAlign: TextAlign.center,
                ),
                Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
