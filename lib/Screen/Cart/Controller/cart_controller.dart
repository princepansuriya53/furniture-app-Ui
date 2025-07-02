import 'package:get/get.dart';

class CartItem {
  final String id;
  final String name;
  final String image;
  final double price;
  final double originalPrice;
  int quantity;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.originalPrice,
    this.quantity = 1,
  });
}

class CartController extends GetxController {
  final RxList<CartItem> cartItems = <CartItem>[
    CartItem(
      id: '1',
      name: 'Comfy Roaster',
      image: 'assets/images/roaster.png',
      price: 24.00,
      originalPrice: 48.00,
    ),
    CartItem(
      id: '2',
      name: 'Croosa',
      image: 'assets/images/chair.png',
      price: 23.00,
      originalPrice: 60.00,
    ),
    CartItem(
      id: '3',
      name: 'Sitra Brows',
      image: 'assets/images/sofa.png',
      price: 99.00,
      originalPrice: 199.00,
    ),
  ].obs;

  void updateQuantity(String id, int newQuantity) {
    if (newQuantity <= 0) {
      removeItem(id);
      return;
    }

    final index = cartItems.indexWhere((item) => item.id == id);
    if (index != -1) {
      cartItems[index].quantity = newQuantity;
      cartItems.refresh();
    }
  }

  void removeItem(String id) {
    cartItems.removeWhere((item) => item.id == id);
  }

  double get totalAmount {
    return cartItems.fold(
      0.0,
      (sum, item) => sum + (item.price * item.quantity),
    );
  }
}
