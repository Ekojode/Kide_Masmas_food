class Menu {
  final String id;
  final String title;
  final double price;
  final String img;
  final String description;
  bool isFavourite;

  Menu({
    required this.id,
    required this.title,
    required this.price,
    required this.img,
    required this.description,
    this.isFavourite = false,
  });
}
