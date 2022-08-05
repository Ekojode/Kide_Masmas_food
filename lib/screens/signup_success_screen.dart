import 'package:flutter/material.dart';
import '../widgets/success_widget.dart';
import '../screens/home_screen.dart';

class SignUpSuccess extends StatelessWidget {
  const SignUpSuccess({Key? key}) : super(key: key);

  static const routeName = "/signUpSuccess";

  @override
  Widget build(BuildContext context) {
    return Success(
        successMessage: "Your Sign Up Process is Complete",
        action: () {
          Navigator.of(context).pushNamed(HomeScreen.routeName);
        },
        actionMessage: "Go to Home");
  }
}
