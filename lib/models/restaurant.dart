import 'package:flutter/material.dart';
import '../models/location.dart';
import '../models/menu.dart';

class Restaurant {
  final String id;
  final String name;
  final String img;
  final String catchPhrase;
  final int distance;
  final List<Menu>? menu;
  final PlaceLocation? location;
  final double? rating;

  Restaurant(
      {required this.id,
      required this.name,
      required this.img,
      required this.catchPhrase,
      this.location,
      required this.distance,
      this.menu,
      this.rating});
}

class Restaurants with ChangeNotifier {
  final List<Restaurant> _restaurants = [
    Restaurant(
      id: "r1",
      name: "Chicken Republic",
      catchPhrase: "Extra-ordinary chicken for extra- ordinary people",
      img:
          "https://www.applyforajob.org/wp-content/uploads/2019/02/Chicken-Republic-Logo.jpg",
      location: PlaceLocation(latitude: 23.3, longitude: 12.4),
      distance: 30,
      menu: [
        Menu(
            id: "a1",
            title: "Jollof rice Chicken",
            price: 3000,
            img:
                "https://theplace.com.ng/wp-content/uploads/2021/06/Intercon.jpg",
            description: "Sweet Jollof from the place"),
      ],
    ),
    Restaurant(
      id: "r2",
      name: "KFC",
      img:
          "https://upload.wikimedia.org/wikipedia/en/thumb/b/bf/KFC_logo.svg/1200px-KFC_logo.svg.png",
      distance: 12,
      catchPhrase: "It's finger licking",
      menu: [
        Menu(
            id: "a2",
            title: "Jollof rice KFC",
            price: 3000,
            img:
                "https://theplace.com.ng/wp-content/uploads/2021/06/Intercon.jpg",
            description: "Sweet Jollof from the place"),
      ],
    ),
    Restaurant(
      id: "r3",
      name: "Mr Biggs",
      img:
          "https://seeklogo.com/images/M/Mr_Biggs-logo-40C29C44C4-seeklogo.com.png",
      distance: 22,
      catchPhrase: "What a delicious experience!",
      menu: [
        Menu(
            id: "a3",
            title: "Jollof rice Mr",
            price: 3000,
            img:
                "https://theplace.com.ng/wp-content/uploads/2021/06/Intercon.jpg",
            description: "Sweet Jollof from the place"),
      ],
    ),
    Restaurant(
      id: "r4",
      name: "Sweet sensation",
      img:
          "https://www.vmcdn.ca/f/files/alimoshotoday/sweet-sensation-logo.png",
      distance: 45,
      catchPhrase: "Sweet Sensations, Hot Temptations",
      menu: [
        Menu(
            id: "a4",
            title: "Jollof rice Sweet",
            price: 3000,
            img:
                "https://theplace.com.ng/wp-content/uploads/2021/06/Intercon.jpg",
            description: "Sweet Jollof from the place"),
      ],
    ),
    Restaurant(
      id: "r5",
      name: "Burger King",
      img:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Burger_King_logo_%281999%29.svg/2024px-Burger_King_logo_%281999%29.svg.png",
      distance: 12,
      catchPhrase: "Be Your Way.",
      //  menu: [],
      // menu: [
      //   Menu(
      //       id: "a5",
      //       title: "Jollof rice Burger",
      //       price: 3000,
      //       img:
      //           "https://theplace.com.ng/wp-content/uploads/2021/06/Intercon.jpg",
      //       description: "Sweet Jollof from the place"),
      // ],
    )
  ];

  List<Restaurant> get restaurants {
    return _restaurants;
  }

  List<Menu> get menu {
    List<Menu> newMenu = [];
    final List<String> menuRestaurants = [];
    for (Restaurant element in _restaurants) {
      if (element.menu != null) {
        menuRestaurants.add(element.name);
        for (Menu element in element.menu!) {
          newMenu.add(element);
        }
      }
    }

    return newMenu;
  }

  Restaurant findRestaurantById(String id) {
    Restaurant foundRestaurant =
        _restaurants.firstWhere((element) => element.id == id);

    return foundRestaurant;
  }

  // void printRest() {
  //   // print(restaurants[4].menu == null);
  //   List<Menu> newMenu = [];
  //   final List<String> menuRestaurants = [];
  //   print(newMenu.isEmpty);
  //   for (Restaurant element in _restaurants) {
  //     if (element.menu != null) {
  //       menuRestaurants.add(element.name);
  //       for (Menu element in element.menu!) {
  //         newMenu.add(element);
  //       }
  //     }
  //   }
  //   print(menuRestaurants);
  //   print(newMenu[0].title);
  // }

  Menu findMenuById(String id) {
    List<Menu> newMenu = [];

    for (Restaurant element in _restaurants) {
      if (element.menu != null) {
        for (Menu elements in element.menu!) {
          newMenu.add(elements);
          // final foundMenu =
          //     element.menu!.firstWhere((element) => elements.id == id);
        }
      }
    }
    Menu foundMenu = newMenu.firstWhere((element) => element.id == id);

    return foundMenu;
  }

  Map<String, Menu> findMenuBgyId(String id) {
    List<Menu> newMenu = [];
    String restaurant = "";
    for (Restaurant element in _restaurants) {
      if (element.menu != null) {
        for (Menu elements in element.menu!) {
          newMenu.add(elements);
          // final foundMenu =
          //     element.menu!.firstWhere((element) => elements.id == id);
        }
      }
    }
    Menu foundMenu = newMenu.firstWhere((element) => element.id == id);
    //  _restaurants.firstWhere((element) => element.menu.firstWhere((element) => element.id == id));

    return {restaurant: foundMenu};
  }

  List<Menu> rest(String id) {
    final mean = _restaurants.firstWhere((element) => element.name == id);
    List<Menu> reso = [];
    for (var element in mean.menu!) {
      reso.add(element);
    }
    return reso;
  }

  void switchFavouriteStatus(String id) {
    List<Menu> newMenu = [];

    for (Restaurant element in _restaurants) {
      if (element.menu != null) {
        for (Menu elements in element.menu!) {
          newMenu.add(elements);
        }
      }
    }
    Menu foundMenu = newMenu.firstWhere((element) => element.id == id);

    foundMenu.isFavourite = !foundMenu.isFavourite;
    notifyListeners();
  }

  Restaurant findMenuRestaurant(Menu menu) {
    var test =
        _restaurants.firstWhere((element) => element.menu!.contains(menu));

    return test;
  }

  List<Restaurant> searchRestaurants(String query) {
    final searchedRestaurant = _restaurants.where((restaurant) {
      final titleLower = restaurant.name.toLowerCase();
      final searchQuery = query.toLowerCase();

      return titleLower.contains(searchQuery);
    }).toList();

    return searchedRestaurant;
  }
}
