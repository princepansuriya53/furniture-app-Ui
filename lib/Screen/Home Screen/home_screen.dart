import 'package:furniture_app/Screen/Home%20Screen/product_view.dart';
import 'package:get/get.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Global/globel_use.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Screen/Home%20Screen/Screen/arrival_screen.dart';
import 'package:furniture_app/Screen/Home%20Screen/Screen/product_search.dart';
import 'package:furniture_app/Screen/Home%20Screen/Controller/home_controller.dart';
import 'package:furniture_app/Screen/Home%20Screen/Widget/product_scanner.dart';
import 'package:furniture_app/Screen/Home%20Screen/Widget/product_widget.dart';
import 'package:furniture_app/Common/textfield_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:lucide_icons/lucide_icons.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  final ThemeController themeController = Get.find<ThemeController>();
  final HomeController productController = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.whiteColor,
      body: screenPadding(
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox(20),
              TextFieldConstant(
                isReadOnly: true,
                hintText: 'Search',
                onTap: () => Get.to(
                  () => ProductSearch(),
                  curve: Curves.easeInOut,
                  transition: Transition.fade,
                  duration: Duration(milliseconds: 500),
                ),
                suffixIcon: Row(
                  spacing: 15.w,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () => Get.to(() => ProductScanner()),
                      child: Icon(LucideIcons.scan),
                    ),
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
              GestureDetector(
                onTap: () => Get.to(() => ArrivalScreen()),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextConstant(
                      fontSize: 20,
                      title: 'New arrivals',
                      fontWeight: FontWeight.w600,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextConstant(title: 'View all', fontSize: 12),
                        widthBox(4),
                        Icon(Icons.arrow_forward_ios, size: 12),
                      ],
                    ),
                  ],
                ),
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
                    return ListView.separated(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: productController.products.length,
                      separatorBuilder: (context, index) => widthBox(10),
                      itemBuilder: (context, index) {
                        return ProductCard(
                          product: productController.products[index],
                        );
                      },
                    );
                  }
                }),
              ),
              heightBox(20),
              TextConstant(
                fontSize: 26,
                title: 'Categories',
                fontWeight: FontWeight.w500,
              ),
              Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(productController.iconPaths.length, (
                    index,
                  ) {
                    final isSelected =
                        productController.selectedIndex.value == index;

                    return GestureDetector(
                      onTap: () => productController.setCategoriesIndex(index),
                      child: AnimatedContainer(
                        padding: EdgeInsets.all(11.h),
                        duration: Duration(milliseconds: 100),
                        margin: EdgeInsets.symmetric(horizontal: 2.w),
                        decoration: BoxDecoration(
                          color: isSelected
                              ? themeController.primaryColor
                              : themeController.whiteColor,
                          borderRadius: BorderRadius.circular(5.r),
                        ),
                        child: SvgPicture.asset(
                          width: 24,
                          height: 24,
                          productController.iconPaths[index],
                          colorFilter: ColorFilter.mode(
                            isSelected
                                ? themeController.blackColor
                                : themeController.greyColor,
                            BlendMode.srcIn,
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              heightBox(16),
              Obx(() {
                final categoryItems = productController.filteredCategories;
                if (categoryItems.isEmpty) {
                  return Center(
                    child: TextConstant(title: 'No items in this category'),
                  );
                }
                return ListView.separated(
                  shrinkWrap: true,
                  itemCount: categoryItems.length,
                  physics: NeverScrollableScrollPhysics(),
                  separatorBuilder: (_, __) => heightBox(10),
                  itemBuilder: (context, index) {
                    final item = categoryItems[index];
                    return GestureDetector(
                      onTap: () {
                        Get.to(
                          transition: Transition.fade,
                          duration: Duration(milliseconds: 300),
                          curve: Curves.easeInOutCubicEmphasized,
                          () => ProductView(productData: categoryItems[index]),
                        );
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.h),
                        decoration: BoxDecoration(
                          color: themeController.whiteColor,
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              offset: Offset(0, 2),
                              color: themeController.blackColor.withValues(
                                alpha: 0.2,
                              ),
                            ),
                          ],
                        ),
                        child: Row(
                          children: [
                            Image.asset(
                              height: 80.h,
                              width: 80.w,
                              item['image'],
                              fit: BoxFit.contain,
                            ),
                            widthBox(10),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  TextConstant(
                                    fontSize: 16,
                                    title: item['name'],
                                    fontWeight: FontWeight.w600,
                                  ),
                                  heightBox(4),
                                  TextConstant(
                                    fontSize: 12,
                                    softWrap: true,
                                    title: item['Description'],
                                  ),
                                  heightBox(4),
                                  Row(
                                    children: [
                                      TextConstant(
                                        fontSize: 14,

                                        title: item['Price'],
                                        fontWeight: FontWeight.w600,
                                      ),
                                      widthBox(8),
                                      TextConstant(
                                        fontSize: 12.sp,

                                        title: item['RealPrice'],
                                        textDecoration:
                                            TextDecoration.lineThrough,
                                      ),
                                      widthBox(8),
                                      Icon(
                                        Icons.star,
                                        size: 14.sp,
                                        color: themeController.primaryColor,
                                      ),
                                      TextConstant(
                                        fontSize: 12,

                                        title: item['Ratings'],
                                      ),
                                      widthBox(6),
                                      TextConstant(
                                        fontSize: 11,

                                        color: themeController.greyColor,
                                        title: "(${item['Reviews']} revixews)",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
