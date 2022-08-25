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

  Restaurant({
    required this.id,
    required this.name,
    required this.img,
    required this.catchPhrase,
    this.location,
    required this.distance,
    this.rating,
    this.menu,
  });
}

class Restaurants with ChangeNotifier {
  final List<Restaurant> _restaurants = [
    Restaurant(
      id: "1",
      name: "Chicken Republic",
      catchPhrase: "Extra-ordinary chicken for extra- ordinary people",
      img:
          "https://www.applyforajob.org/wp-content/uploads/2019/02/Chicken-Republic-Logo.jpg",
      location: PlaceLocation(
          latitude: 6.640711970164805, longitude: 3.369001995300256),
      distance: 30,
      rating: 4.8,
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
      id: "2",
      name: "KFC",
      img:
          "https://upload.wikimedia.org/wikipedia/en/thumb/b/bf/KFC_logo.svg/1200px-KFC_logo.svg.png",
      distance: 12,
      catchPhrase: "It's finger licking",
      rating: 4.8,
      location: PlaceLocation(
          latitude: 6.638651191481367, longitude: 3.3697993229932166),
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
      id: "3",
      name: "Mr Biggs",
      img:
          "https://seeklogo.com/images/M/Mr_Biggs-logo-40C29C44C4-seeklogo.com.png",
      distance: 22,
      catchPhrase: "What a delicious experience!",
      rating: 4.8,
      location: PlaceLocation(
          latitude: 6.610235897295476, longitude: 3.3182841885403485),
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
      id: "4",
      name: "Sweet sensation",
      img:
          "https://www.vmcdn.ca/f/files/alimoshotoday/sweet-sensation-logo.png",
      distance: 45,
      catchPhrase: "Sweet Sensations, Hot Temptations",
      rating: 4.8,
      location: PlaceLocation(
          latitude: 6.610065377060151, longitude: 3.3090144749515527),
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
      id: "5",
      name: "Burger King",
      img:
          "https://upload.wikimedia.org/wikipedia/commons/thumb/8/85/Burger_King_logo_%281999%29.svg/2024px-Burger_King_logo_%281999%29.svg.png",
      distance: 12,
      rating: 4.8,
      location: PlaceLocation(
          latitude: 6.5079080403969245, longitude: 3.3785346988254887),
      catchPhrase: "Be Your Way.",
      menu: [
        Menu(
            id: "a5",
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

  Restaurant findRestaurantById(String id) {
    List<Restaurant> newRestaurant = [];

    for (Restaurant element in _restaurants) {
      // if (element.id != null) {
      // for (Restaurant elements in element.id) {
      newRestaurant.add(element);
      // final foundMenu =
      //     element.menu!.firstWhere((element) => elements.id == id);
      // }
      // }
    }
    Restaurant foundRestaurant =
        newRestaurant.firstWhere((element) => element.id == id);

    return foundRestaurant;
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

  Restaurant? findMenuRestaurant(String id) {
    Restaurant? foundRestaurant;
    for (Restaurant res in _restaurants) {
      if (res.menu != null) {
        Menu? chosen = res.menu?.firstWhere((element) => element.id == id);
        for (Restaurant res in _restaurants) {
          if (res.menu != null) {
            for (Menu men in res.menu!) {
              if (men == chosen) {
                foundRestaurant = res;
              }
            }
          }
        }
      }
    }
    return foundRestaurant;
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
