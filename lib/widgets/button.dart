import 'package:flutter/material.dart';

import '../global/app_color.dart';
import '../global/app_text_style.dart';

class Button extends StatelessWidget {
  final double height;
  final double width;
  final String text;
  final VoidCallback onTap;
  const Button(
      {Key? key,
      required this.text,
      required this.onTap,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: InkWell(
        onTap: onTap,
        child: Container(
          height: height,
          width: width,
          decoration: BoxDecoration(
            gradient: const LinearGradient(
                colors: [greenColor1, greenColor2],
                begin: Alignment.bottomLeft,
                end: Alignment.topRight),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Text(
              text,
              style: textStyle3,
            ),
          ),
        ),
      ),
    );
  }
}
