import 'package:flutter/material.dart';
import 'package:masmas_food/screens/home_screen.dart';
//import 'package:masmas_food/widgets/bottom_bar.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  static const routeName = "/cartScreen";
  @override
  Widget build(BuildContext context) {
    return /*const Scaffold(
      body: */
        Center(
            child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(HomeScreen.routeName);
                },
                child: const Text("Push Home")));
    //    persistentFooterButtons: [BottomVBar(pageNum: 2)],
    // bottomNavigationBar: BottomNavBar(currentIndex: 2, routeName: routeName),
    //   );
  }
}
