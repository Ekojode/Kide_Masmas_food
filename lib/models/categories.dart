import 'package:flutter/material.dart';

import '../models/menu.dart';

class Category {
  final String name;
  final String img;
  final List<Menu>? menus;

  Category({required this.name, required this.img, this.menus});
}

class Categories with ChangeNotifier {
  final List<Category> _categories = [];

  List<Category> get categories {
    return _categories;
  }
}
