import 'package:flutter/material.dart';

class DummyScreen extends StatelessWidget {
  const DummyScreen({Key? key}) : super(key: key);

  static const routeName = "/dummy";
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Login was sucessful"),
      ),
    );
  }
}
