import 'package:flutter/material.dart';
import '../models/location.dart';
import '../models/menu.dart';

class Restaurant {
  final String name;
  final String img;
  final int distance;
  final List<Menu>? menu;
  final PlaceLocation? location;

  Restaurant({
    required this.name,
    required this.img,
    this.location,
    required this.distance,
    this.menu,
  });
}

class Restaurants with ChangeNotifier {
  final List<Restaurant> _restaurants = [
    Restaurant(
      name: "Chicken Republic",
      img:
          "https://www.applyforajob.org/wp-content/uploads/2019/02/Chicken-Republic-Logo.jpg",
      location: PlaceLocation(latitude: 23.3, longitude: 12.4),
      distance: 30,
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
    ),
    Restaurant(
      name: "KFC",
      img: "http://logo-logos.com/2017/06/KFC_Logo.png",
      distance: 12,
    ),
    Restaurant(
      name: "Mr Biggs",
      img:
          "https://seeklogo.com/images/M/Mr_Biggs-logo-40C29C44C4-seeklogo.com.png",
      distance: 22,
    ),
    Restaurant(
      name: "Sweet sensation",
      img:
          "https://www.vmcdn.ca/f/files/alimoshotoday/sweet-sensation-logo.png",
      distance: 45,
    ),
    Restaurant(
      name: "Burger King",
      img:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Burger_King_logo_%281999%29.svg/2024px-Burger_King_logo_%281999%29.svg.png",
      distance: 12,
    )
  ];

  List<Restaurant> get restaurants {
    return _restaurants;
  }
}
