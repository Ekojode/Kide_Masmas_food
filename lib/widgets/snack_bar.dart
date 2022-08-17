import 'package:flutter/material.dart';
import 'package:masmas_food/global/app_color.dart';

class SnackBarWidget extends StatelessWidget {
  final String message;
  const SnackBarWidget({Key? key, required this.message}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: greenColor2,
      duration: const Duration(milliseconds: 2000),
    );
  }
}
