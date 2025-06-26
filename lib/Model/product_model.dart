 

class Product {
  final int id;
  bool isFavorite;
  final String name;
  final double price;
  final String imagePath; 

  Product({
    required this.id,
    required this.name,
    required this.price,
    required this.imagePath, 
    this.isFavorite = false,
  });
}
