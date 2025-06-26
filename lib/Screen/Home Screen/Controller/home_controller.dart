import 'package:get/get.dart';
import 'package:furniture_app/Model/product_model.dart';
import 'package:furniture_app/Constants/app_assets.dart';

class ProductController extends GetxController {
  final RxBool isLoading = false.obs;
  final RxList<Product> products = <Product>[].obs;
  final RxList<Product> favoriteProducts = <Product>[].obs;
  final RxMap<int, bool> favoriteStatus = <int, bool>{}.obs;

  @override
  void onInit() {
    super.onInit();
    loadProducts();
  }

  void loadProducts() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      products.value = [
        Product(
          id: 1,
          price: 29.99,
          name: 'Comfy Roaster',
          realPrice: 47.50,
          imagePath: AppAssets.sofa1,
        ),
        Product(
          id: 2,
          price: 24.99,
          realPrice: 28.70,
          name: 'Sera Core',
          imagePath: AppAssets.sofa2,
        ),
        Product(
          id: 3,
          price: 34.99,
          realPrice: 70.10,
          name: 'Beast Treas',
          imagePath: AppAssets.sofa3,
        ),
        Product(
          id: 4,
          price: 39.99,
          realPrice: 47.50,
          name: 'Modern Chair',
          imagePath: AppAssets.sofa6,
        ),
        Product(
          id: 5,
          price: 49.99,
          realPrice: 90.50,
          name: 'Luxury Seat',
          imagePath: AppAssets.sofa7,
        ),
        Product(
          id: 6,
          price: 87.60,
          realPrice: 104.30,
          name: 'Double Daker Seat',
          imagePath: AppAssets.sofa8,
        ),
      ];
      updateFavoritesList();
      isLoading.value = false;
    });
  }

  void toggleFavorite(int productId) {
    final currentStatus = favoriteStatus[productId] ?? false;

    favoriteStatus[productId] = !currentStatus;

    final product = products.firstWhereOrNull((p) => p.id == productId);
    if (product != null) {
      updateFavoritesList();
      /*  Get.snackbar(
        product.name,
        favoriteStatus[productId]!
            ? 'Added to Favorites'
            : 'Removed from Favorites',
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        duration: const Duration(seconds: 1),
        backgroundColor: favoriteStatus[productId]! ? Colors.green : Colors.red,
      ); */
    }
  }

  bool isFavorite(int productId) {
    return favoriteStatus[productId] ?? false;
  }

  void updateFavoritesList() {
    favoriteProducts.value = products
        .where((p) => favoriteStatus[p.id] ?? false)
        .toList();
  }

  Product? getProductById(int id) {
    try {
      return products.firstWhere((p) => p.id == id);
    } catch (e) {
      return null;
    }
  }

  void navigateToProductDetail(int productId) {
    print('Navigate to product detail: $productId');
  }

  void navigateToAllProducts() {
    print('Navigate to all products');
  }
}
