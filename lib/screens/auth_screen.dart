import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  static const routeName = "/authScreen";

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //   SizedBox(height: 5.h),
          SizedBox(
            height: 45.h,
            child: Stack(
              children: <Widget>[
                Image.asset(
                  "assets/images/Pattern.png",
                  fit: BoxFit.cover,
                ),
                Container(
                  margin: EdgeInsets.all(10.h),
                  child: Image.asset(
                    "assets/images/Logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 35.h,
          ),
          SizedBox(
            height: 20.h,
          )
        ],
      ),
    );
  }
}
