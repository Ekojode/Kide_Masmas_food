import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  static const routeName = "/profileScreen";

  @override
  Widget build(BuildContext context) {
    return const Center(child: Text("Profile Screen"));
    // bottomNavigationBar: BottomNavBar(currentIndex: 4, routeName: routeName),
  }
}
