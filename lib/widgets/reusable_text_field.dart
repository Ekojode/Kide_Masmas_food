import 'package:flutter/material.dart';

import '../global/app_color.dart';

class ReusableText extends StatefulWidget {
  final TextEditingController? controller;
  final String labelText;
  final String? Function(String?)? validator;
  const ReusableText(
      {Key? key,
      required this.controller,
      required this.labelText,
      this.validator})
      : super(key: key);

  @override
  State<ReusableText> createState() => _ReusableTextState();
}

class _ReusableTextState extends State<ReusableText> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      controller: widget.controller,
      decoration: InputDecoration(
        labelText: widget.labelText,
        enabledBorder: OutlineInputBorder(
          //   borderSide: const BorderSide(width: 3, color: Colors.grey),
          borderRadius: BorderRadius.circular(20),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 3, color: greenColor1),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}
