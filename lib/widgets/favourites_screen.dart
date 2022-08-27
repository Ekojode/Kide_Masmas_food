import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:masmas_food/global/app_color.dart';

class FavouritesScreen extends StatefulWidget {
  const FavouritesScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<FavouritesScreen> createState() => _FavouritesScreenState();
}

class _FavouritesScreenState extends State<FavouritesScreen> {
  int stackIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                decoration: stackIndex == 0
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 4, color: orangeColor1),
                        ),
                      )
                    : null,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: greenColor2,
                    textStyle: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      stackIndex = 0;
                    });
                  },
                  child: const Text("Menu"),
                ),
              ),
              Container(
                decoration: stackIndex == 1
                    ? const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(width: 4, color: orangeColor1),
                        ),
                      )
                    : null,
                child: TextButton(
                  style: TextButton.styleFrom(
                    primary: greenColor2,
                    textStyle: TextStyle(
                      fontSize: 22.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    setState(() {
                      stackIndex = 1;
                    });
                  },
                  child: const Text("Favourites"),
                ),
              ),
            ],
          ),
        ),
        IndexedStack(
          index: stackIndex,
          children: const [
            SizedBox(
              child: Text("List of Favourite Meals"),
            ),
            SizedBox(
              child: Text("List of favourite restaurants"),
            )
          ],
        ),
      ],
    );
  }
}
