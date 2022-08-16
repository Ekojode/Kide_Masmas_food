import "package:flutter/material.dart";
import 'package:masmas_food/models/restaurant.dart';
import "../models/menu.dart";

class CartItem {
  final String id;
  final double price;
  final int quantity;
  final String imgUrl;
  final String title;
  final Restaurant restaurant;
  CartItem(
      {required this.id,
      required this.price,
      required this.quantity,
      required this.imgUrl,
      required this.title,
      required this.restaurant});
}

class Cart with ChangeNotifier {
  final Map<String, CartItem> _cartItems = {};

  Map<String, CartItem> get cartItems {
    return _cartItems;
  }

  void addCartItem(Menu menuItem, Restaurant restaurant) {
    if (_cartItems.containsKey(menuItem.id)) {
      return;
    } else {
      _cartItems.putIfAbsent(
          menuItem.id,
          () => CartItem(
              id: DateTime.now().toIso8601String(),
              restaurant: restaurant,
              price: menuItem.price,
              quantity: 1,
              imgUrl: menuItem.img,
              title: menuItem.title));
      notifyListeners();
    }
  }

  void cartItemIncrement(String id) {
    if (_cartItems.containsKey(id)) {
      _cartItems.update(
        id,
        (cartItem) => CartItem(
            id: cartItem.id,
            restaurant: cartItem.restaurant,
            price: cartItem.price,
            quantity: cartItem.quantity + 1,
            imgUrl: cartItem.imgUrl,
            title: cartItem.title),
      );
      notifyListeners();
    }
  }

  void cartItemDecrement(String id) {
    if (_cartItems.containsKey(id)) {
      _cartItems.update(
        id,
        (cartItem) => CartItem(
            id: cartItem.id,
            restaurant: cartItem.restaurant,
            price: cartItem.price,
            quantity: cartItem.quantity - 1,
            imgUrl: cartItem.imgUrl,
            title: cartItem.title),
      );
      notifyListeners();
    }
  }

  int get cartQuantity {
    return _cartItems.length;
  }
}
