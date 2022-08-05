import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ErrorDialog extends StatelessWidget {
  final String errorMessage;
  const ErrorDialog({Key? key, required this.errorMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("An error occurred!"),
      titleTextStyle: TextStyle(fontSize: 20.sp, color: Colors.red),
      content: Text(errorMessage),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text("Close",
              style: TextStyle(fontWeight: FontWeight.bold)),
        )
      ],
    );
  }
}
