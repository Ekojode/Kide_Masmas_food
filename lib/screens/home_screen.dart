import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routeName = "/home";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [Row()],
      ),
      bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.orange,
          selectedItemColor: Colors.red,
          // fixedColor: Colors.purple,
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Camera',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket),
              label: 'Calls',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Camera',
            ),
          ]),
    );
  }
}
