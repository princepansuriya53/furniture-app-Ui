import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Model/product_model.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Screen/Home%20Screen/Widget/product_scanner.dart';
import 'package:furniture_app/Screen/Home%20Screen/Controller/home_controller.dart';
import 'package:furniture_app/Screen/Home%20Screen/Widget/product_widget.dart';
import 'package:furniture_app/Common/textfield_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:lucide_icons/lucide_icons.dart';

class ProductSearch extends StatelessWidget {
  const ProductSearch({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    final HomeController productController = Get.put(HomeController());

    return Scaffold(
      backgroundColor: themeController.whiteColor,
      appBar: commonAppbar(
        title: 'Search Product',
        themeController: themeController,
      ),
      body: screenPadding(
        child: Column(
          children: [
            TextFieldConstant(
              hintText: 'Search',
              controller: productController.searchController,
              onChanged: (value) => productController.searchProducts(value),
              suffixIcon: Row(
                spacing: 15.w,
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GestureDetector(
                    child: Icon(LucideIcons.scan),
                    onTap: () => Get.to(() => ProductScanner()),
                  ),
                  Icon(LucideIcons.search),
                  SizedBox(),
                ],
              ),
            ),

            Obx(() {
              final filteredList = productController.searchResults;

              if (filteredList.isEmpty) {
                return Expanded(
                  child: Center(
                    child: TextConstant(
                      fontSize: 16,
                      title: 'No results found',
                    ),
                  ),
                );
              }

              return Expanded(
                child: GridView.builder(
                  keyboardDismissBehavior:
                      ScrollViewKeyboardDismissBehavior.onDrag,
                  padding: EdgeInsets.symmetric(vertical: 20.h),
                  itemCount: filteredList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredList[index];
                    final product = Product(
                      id: item['id'],
                      name: item['name'],
                      imagePath: item['image'],
                      price: item['Price'].toString(),
                      realPrice: item['RealPrice'].toString(),
                    );

                    return ProductCard(product: product);
                  },
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
