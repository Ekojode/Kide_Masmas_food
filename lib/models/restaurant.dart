import 'package:flutter/material.dart';
import '../models/location.dart';
import '../models/menu.dart';

class Restaurant {
  final String name;
  final String img;
  final List<Menu>? menu;
  final PlaceLocation location;

  Restaurant({
    required this.name,
    required this.img,
    required this.location,
    this.menu,
  });
}

class Restaurants with ChangeNotifier {
  final List<Restaurant> _restaurants = [
    Restaurant(
      name: "Vegan Resto",
      img: "img",
      location: PlaceLocation(latitude: 23.3, longitude: 12.4),
      menu: [
        Menu(
            title: "Jollof Rice",
            price: 15,
            img: "img",
            description: "Beautifully cooked Jollof rice"),
        Menu(
            title: "Jollof Rice",
            price: 15,
            img: "img",
            description: "Beautifully cooked Jollof rice")
      ],
    )
  ];

  List<Restaurant> get restaurant {
    return _restaurants;
  }

  void testFunction() {
    //  print(_restaurants[0].menu![1]);
  }
}
