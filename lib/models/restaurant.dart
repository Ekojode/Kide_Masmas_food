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

final List<Menu> menus = [
  Menu(
      title: "Jollof rice",
      price: 3000,
      img: "https://theplace.com.ng/wp-content/uploads/2021/06/Intercon.jpg",
      description: "Sweet Jollof from the place"),
];

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
            title: "Jollof rice Chicken",
            price: 3000,
            img:
                "https://theplace.com.ng/wp-content/uploads/2021/06/Intercon.jpg",
            description: "Sweet Jollof from the place"),
      ],
    ),
    Restaurant(
      name: "KFC",
      img:
          "https://upload.wikimedia.org/wikipedia/en/thumb/b/bf/KFC_logo.svg/1200px-KFC_logo.svg.png",
      distance: 12,
      menu: [
        Menu(
            title: "Jollof rice KFC",
            price: 3000,
            img:
                "https://theplace.com.ng/wp-content/uploads/2021/06/Intercon.jpg",
            description: "Sweet Jollof from the place"),
      ],
    ),
    Restaurant(
      name: "Mr Biggs",
      img:
          "https://seeklogo.com/images/M/Mr_Biggs-logo-40C29C44C4-seeklogo.com.png",
      distance: 22,
      menu: [
        Menu(
            title: "Jollof rice Mr",
            price: 3000,
            img:
                "https://theplace.com.ng/wp-content/uploads/2021/06/Intercon.jpg",
            description: "Sweet Jollof from the place"),
      ],
    ),
    Restaurant(
      name: "Sweet sensation",
      img:
          "https://www.vmcdn.ca/f/files/alimoshotoday/sweet-sensation-logo.png",
      distance: 45,
      menu: [
        Menu(
            title: "Jollof rice Sweet",
            price: 3000,
            img:
                "https://theplace.com.ng/wp-content/uploads/2021/06/Intercon.jpg",
            description: "Sweet Jollof from the place"),
      ],
    ),
    Restaurant(
      name: "Burger King",
      img:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Burger_King_logo_%281999%29.svg/2024px-Burger_King_logo_%281999%29.svg.png",
      distance: 12,
      menu: [
        Menu(
            title: "Jollof rice Burger",
            price: 3000,
            img:
                "https://theplace.com.ng/wp-content/uploads/2021/06/Intercon.jpg",
            description: "Sweet Jollof from the place"),
      ],
    )
  ];

  List<Restaurant> get restaurants {
    return _restaurants;
  }

  List<Menu> get menu {
    List<Menu> newMenu = [];
    for (var element in _restaurants) {
      if (element.menu != null) {
        for (var element in element.menu!) {
          newMenu.add(element);
        }
      }
    }
    return newMenu;
  }
}
