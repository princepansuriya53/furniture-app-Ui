import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Model/product_model.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class HomeController extends GetxController {
  final selectedColorIndex = 0.obs;
  final RxInt selectedIndex = 0.obs;
  final RxInt isSelected = 0.obs;
  late QRViewController qrController;
  final RxBool isLoading = false.obs;
  final RxList<Product> products = <Product>[].obs;
  final RxList<Product> favoriteProducts = <Product>[].obs;
  final RxMap<int, bool> favoriteStatus = <int, bool>{}.obs;
  final TextEditingController searchController = TextEditingController();
  final RxList<Map<String, dynamic>> filteredCategories =
      <Map<String, dynamic>>[].obs;
  final RxList<Map<String, dynamic>> searchResults =
      <Map<String, dynamic>>[].obs;

  final List<String> iconPaths = [
    AppAssets.stared,
    AppAssets.dinerTable,
    AppAssets.char,
    AppAssets.bead,
    AppAssets.sofaChair,
    AppAssets.sleepingChair,
  ];

  final List<Color> colors = [
    Colors.yellow,
    Colors.teal,
    Colors.indigo.shade900,
    Colors.orange,
  ];

  void selectColor(int index) {
    selectedIndex.value = index;
  }

  final CategoriesList = [
    {
      'id': 0,
      'Price': "19,999",
      'Ratings': '4.5',
      'Reviews': '312',
      'RealPrice': '25,999',
      'name': 'Emerald Velvet Sofa',
      'image': AppAssets.doubleSofa,
      'Description':
          'A luxurious velvet sofa with plush cushions and modern wooden legs, perfect for stylish living rooms.',
    },
    {
      'id': 1,
      'Ratings': '4.2',
      'Reviews': '205',
      'Price': '14,499',
      'RealPrice': '18,000',
      'name': 'Yellow Casual Sofa',
      'image': AppAssets.doubleSofa2,
      'Description':
          'A bright and cheerful yellow sofa, compact and cozy with soft pillows for a casual look.',
    },
    {
      'id': 2,
      'Ratings': '4.7',
      'Reviews': '420',
      'Price': '29,999',
      'RealPrice': '35,000',
      'name': 'White Comfort Bed',
      'image': AppAssets.sleepingBead,
      'Description':
          'Spacious and soft white bed with an elegant headboard and leopard cushion for a touch of luxury.',
    },
    {
      'id': 4,
      'Price': '2,499',
      'Ratings': '4.1',
      'Reviews': '58',
      'RealPrice': '3,200',
      'name': 'Classic Wooden Stool',
      'image': AppAssets.doubleSofa3,
      'Description':
          'Simple and sturdy white wooden stool suitable for kitchen counters or high desks.',
    },
    {
      'id': 6,
      'Reviews': '365',
      'Ratings': '4.6',
      'Price': '21,499',
      'RealPrice': '27,000',
      'name': 'Tan Leather Sofa',
      'image': AppAssets.sofaLarge,
      'Description':
          'Premium tan leather sofa with deep cushions and mid-century style wooden legs.',
    },
  ];

  void searchProducts(String query) {
    if (query.isEmpty) {
      searchResults.assignAll(CategoriesList);
    } else {
      searchResults.assignAll(
        CategoriesList.where(
          (item) => (item['name'] as String).toLowerCase().contains(
            query.toLowerCase(),
          ),
        ).toList(),
      );
    }
  }

  @override
  void onInit() {
    super.onInit();
    loadProducts();
    filterCategoryProducts();
    searchResults.assignAll(CategoriesList);
  }

  void setCategoriesIndex(int index) {
    selectedIndex.value = index;
    filterCategoryProducts();
  }

  void filterCategoryProducts() {
    if (selectedIndex.value == 0) {
      filteredCategories.value = CategoriesList;
    } else {
      filteredCategories.value = CategoriesList.where(
        (element) => element['id'] == selectedIndex.value,
      ).toList();
    }
  }

  void loadProducts() {
    isLoading.value = true;
    Future.delayed(const Duration(seconds: 2), () {
      products.value = [
        Product(
          id: 1,
          price: "29.99",
          realPrice: "47.50",
          name: 'Comfy Roaster',
          imagePath: AppAssets.sofa1,
        ),
        Product(
          id: 2,
          price: "24.99",
          realPrice: "28.70",
          name: 'Sera Core',
          imagePath: AppAssets.sofa2,
        ),
        Product(
          id: 3,
          price: "34.99",
          realPrice: "70.10",
          name: 'Beast Treas',
          imagePath: AppAssets.sofa3,
        ),
        Product(
          id: 4,
          price: "39.99",
          realPrice: "47.50",
          name: 'Modern Chair',
          imagePath: AppAssets.sofa4,
        ),
        Product(
          id: 5,
          price: "49.99",
          realPrice: "90.50",
          name: 'Luxury Seat',
          imagePath: AppAssets.sofa5,
        ),
        Product(
          id: 6,
          price: "87.60",
          realPrice: "104.30",
          name: 'Double Dakar Seat',
          imagePath: AppAssets.sofa6,
        ),
        Product(
          id: 7,
          price: "60.60",
          realPrice: "102.30",
          name: 'Single Dakar Seat',
          imagePath: AppAssets.sofa7,
        ),
        Product(
          id: 8,
          price: "87.60",
          realPrice: "104.30",
          name: 'Dakar Seat',
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
    updateFavoritesList();
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

  void startScanning() async {
    final status = await Permission.camera.status;
    print("Camera permission status: $status");
    if (status.isGranted) {
      startQrListening();
    } else if (status.isDenied || status.isRestricted || status.isLimited) {
      final result = await Permission.camera.request();
      if (result.isGranted) {
        startQrListening();
      } else if (result.isPermanentlyDenied) {
        openAppSettings();
      }
    } else if (status.isPermanentlyDenied) {
      openAppSettings();
    }
  }

  void startQrListening() async {
    final status = await Permission.camera.status;

    if (status.isDenied || status.isPermanentlyDenied) {
      final result = await Permission.camera.request();

      if (!result.isGranted) {
        Get.snackbar(
          "Permission Denied",
          "Camera permission is required to scan QR codes.",
        );
        return;
      }
    }

    qrController.scannedDataStream.listen((scanData) {
      final scannedId = int.tryParse(scanData.code ?? '');

      if (scannedId != null) {
        final product = getProductById(scannedId);
        if (product != null) {
          qrController.pauseCamera();
          Get.snackbar("Product Found", product.name);
        } else {
          Get.snackbar("Not Found", "No product with ID $scannedId found");
        }
      } else {
        Get.snackbar("Invalid QR", "The scanned QR is not valid.");
      }
    });
  }

  void resumeCamera() {
    qrController.resumeCamera();
  }
}
