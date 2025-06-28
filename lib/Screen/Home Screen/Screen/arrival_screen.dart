import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Model/product_model.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Screen/Home%20Screen/Widget/product_widget.dart';
import 'package:furniture_app/Screen/Home%20Screen/Controller/home_controller.dart';

class ArrivalScreen extends StatelessWidget {
  ArrivalScreen({super.key});

  final ThemeController themeController = ThemeController();
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: 'New Arrivals',
        themeController: themeController,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        child: Obx(() {
          final List<Product> productList = controller.products;
          return GridView.builder(
            itemCount: productList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisExtent: 180,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
            ),
            itemBuilder: (context, index) {
              final product = productList[index];

              return ProductCard(product: product);
            },
          );
        }),
      ),
    );
  }
}
