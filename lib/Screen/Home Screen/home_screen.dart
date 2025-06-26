import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:furniture_app/Global/globel_use.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Common/textfield_constant.dart';
import 'package:furniture_app/Screen/Home%20Screen/Widget/product_widget.dart';
import 'package:furniture_app/Screen/Home%20Screen/Controller/home_controller.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ThemeController themeController = ThemeController();
  final ProductController productController = Get.put(ProductController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: 'Arino',
        isCenterTitle: false,
        isLeadingEnable: false,
        themeController: themeController,
        actionWidget: [
          CircleAvatar(
            backgroundColor: themeController.primaryColor.withValues(
              alpha: 0.2,
            ),
            child: Icon(
              Icons.favorite_border_outlined,
              color: themeController.primaryColor,
            ),
          ),
          widthBox(8),
          CircleAvatar(
            backgroundImage: NetworkImage(
              scale: 3,
              'https://images.unsplash.com/photo-1544005313-94ddf0286df2?q=80&w=1976&auto=format&fit=crop&ixlib=rb-4.1.0&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
            ),
          ),
          widthBox(8),
        ],
      ),
      body: screenPadding(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            children: [
              heightBox(20),
              TextFieldConstant(
                hintText: 'Search',
                suffixIcon: Row(
                  spacing: 15.w,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(LucideIcons.scan),
                    Icon(LucideIcons.search),
                    SizedBox(),
                  ],
                ),
              ),
              heightBox(30),
              Container(
                width: Get.width,
                height: baseHeight / 6,
                padding: EdgeInsets.only(top: 10.h, left: 15.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  color: themeController.primaryColor.withAlpha(50),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextConstant(
                          fontSize: 17,
                          softWrap: true,
                          fontWeight: FontWeight.w700,
                          title: '33%\nOff on\nNew arrivals',
                        ),
                        heightBox(10),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            TextConstant(title: 'Explore'),
                            widthBox(5),
                            Icon(LucideIcons.moveRight, size: 13.sp),
                          ],
                        ),
                      ],
                    ),
                    Transform.translate(
                      offset: Offset(20, -20),
                      child: Image.asset(
                        width: 180.w,
                        height: 180.h,
                        AppAssets.sofa1,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ],
                ),
              ),
              heightBox(20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextConstant(
                    fontSize: 20,
                    title: 'New arrivals',
                    fontWeight: FontWeight.w600,
                  ),
                  GestureDetector(
                    onTap: () => productController.navigateToAllProducts(),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextConstant(title: 'View all', fontSize: 12),
                        widthBox(4),
                        Icon(size: 12, Icons.arrow_forward_ios),
                      ],
                    ),
                  ),
                ],
              ),
              heightBox(16),
              SizedBox(
                height: 180.h,
                child: Obx(() {
                  if (productController.isLoading.value) {
                    return Center(
                      child: loader(themeController: themeController),
                    );
                  } else if (productController.products.isEmpty) {
                    return Center(
                      child: TextConstant(title: 'No products available'),
                    );
                  } else {
                    return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: productController.products.length,
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: productController.products[index],
                        );
                      },
                    );
                  }
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
