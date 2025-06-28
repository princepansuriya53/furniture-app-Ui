import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Model/product_model.dart';
import 'package:furniture_app/Screen/Home%20Screen/Controller/home_controller.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get.dart';

class ProductCard extends StatelessWidget {
  final Product product;

  ProductCard({Key? key, required this.product});

  final ThemeController themeController = ThemeController();
  final HomeController productController = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => productController.navigateToProductDetail(product.id),
      child: Container(
        width: 160.w,
        decoration: BoxDecoration(
          color: themeController.GreayColor,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Container(
                  height: 100.h,
                  width: 130.w,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.contain,
                      image: AssetImage(product.imagePath),
                    ),
                  ),
                ),
              ),
              Divider(),
              TextConstant(
                maxLines: 2,
                fontSize: 14,
                title: product.name,
                fontWeight: FontWeight.w500,
                overflow: TextOverflow.ellipsis,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextConstant(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                    title: '\$${product.price.toStringAsFixed(2)}',
                  ),
                  TextConstant(
                    fontSize: 9,
                    textDecoration: TextDecoration.lineThrough,
                    title: '\$${product.realPrice.toStringAsFixed(2)}',
                  ),
                  widthBox(20),
                  Container(
                    height: 30.h,
                    width: 30.w,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: themeController.whiteColor.withAlpha(230),
                    ),
                    child: Obx(
                      () => IconButton(
                        iconSize: 18.sp,
                        padding: EdgeInsets.zero,
                        onPressed: () =>
                            productController.toggleFavorite(product.id),
                        color: productController.isFavorite(product.id)
                            ? themeController.primaryColor
                            : themeController.greyColor,

                        icon: Icon(
                          productController.isFavorite(product.id)
                              ? Icons.favorite
                              : Icons.favorite_border,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
