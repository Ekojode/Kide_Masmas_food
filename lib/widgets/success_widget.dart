import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../global/app_color.dart';
import '../widgets/action_button.dart';

class Success extends StatelessWidget {
  final String successMessage;
  final VoidCallback action;
  final String actionMessage;
  const Success(
      {Key? key,
      required this.successMessage,
      required this.action,
      required this.actionMessage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(height: 2.h),
          SizedBox(
            height: 65.h,
            child: Column(
              children: [
                SizedBox(
                  height: 45.h,
                  child: Image.asset(
                    "assets/images/Pattern.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Center(
                  child: SizedBox(
                    height: 20.h,
                    child: Image.asset(
                      "assets/images/success.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 2.h),
          Text(
            "Congrats!",
            style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
                color: greenColor1),
          ),
          SizedBox(height: 2.h),
          Text(successMessage,
              style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
          SizedBox(height: 12.h),
          ActionButton(
              height: 8.h, width: 30.h, onTap: action, text: actionMessage),
        ],
      ),
    );
  }
}
