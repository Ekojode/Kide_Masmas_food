import "package:flutter/material.dart";
import 'package:masmas_food/widgets/text_widget.dart';
import '../global/app_text_style.dart';

class RowTextBtn extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;
  const RowTextBtn({Key? key, required this.text, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextWidget(text: text, textStyle: textStyle7),
        const Spacer(),
        TextButton(
          onPressed: onPressed,
          child: TextWidget(text: "View More", textStyle: textStyle6),
        )
      ],
    );
  }
}
