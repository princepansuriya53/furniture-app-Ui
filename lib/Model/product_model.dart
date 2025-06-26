class Product {
  final int id;
  bool isFavorite;
  final String name;
  final double price;
  final double realPrice;
  final String imagePath;

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath,
    required this.realPrice,
    this.isFavorite = false,
  });
}
