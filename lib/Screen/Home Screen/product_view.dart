import 'package:furniture_app/Common/text_constant.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Screen/Home%20Screen/Controller/home_controller.dart';

class ProductView extends StatelessWidget {
  final Map<String, dynamic> productData;

  ProductView({super.key, required this.productData});

  final ThemeController themeController = ThemeController();
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
    print('Product Data: $productData');
    return Scaffold(
      backgroundColor: themeController.whiteColor,
      appBar: commonAppbar(title: '', themeController: themeController),
      body: screenPadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 350.h,
                width: 330.w,
                decoration: BoxDecoration(
                  color: themeController.GreayColor,
                  borderRadius: BorderRadius.circular(20.r),
                ),
                child: Stack(
                  children: [
                    Center(
                      child: Image.asset(
                        fit: BoxFit.contain,
                        productData['image'],
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: EdgeInsets.only(top: 20.h, right: 20.w),
                        child: CircleAvatar(
                          backgroundColor: themeController.offWhiteColor,
                          child: IconButton(
                            onPressed: () {},
                            tooltip: 'Add to Wishlist',
                            icon: Icon(LucideIcons.heart),
                            color: themeController.primaryColor,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      left: 60.w,
                      bottom: 20.h,
                      child: Container(
                        height: 45.h,
                        decoration: BoxDecoration(
                          color: themeController.whiteColor,
                          borderRadius: BorderRadius.circular(13.r),
                        ),
                        child: ListView.separated(
                          shrinkWrap: true,
                          padding: EdgeInsets.symmetric(horizontal: 25.w),
                          scrollDirection: Axis.horizontal,
                          itemCount: homeController.colors.length,
                          separatorBuilder: (context, index) => widthBox(20),
                          itemBuilder: (context, index) {
                            return Obx(() {
                              final isSelected =
                                  index == homeController.selectedIndex.value;
                              return GestureDetector(
                                onTap: () => homeController.selectColor(index),
                                child: AnimatedContainer(
                                  height: 25,
                                  width: 25,
                                  duration: Duration(milliseconds: 300),
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: homeController.colors[index],
                                    border: isSelected
                                        ? Border.all(
                                            width: 1,
                                            color: themeController.whiteColor,
                                          )
                                        : null,
                                    boxShadow: isSelected
                                        ? [
                                            BoxShadow(
                                              blurRadius: 1,
                                              spreadRadius: 1,
                                              color: themeController.blackColor
                                                  .withValues(alpha: 0.2),
                                            ),
                                          ]
                                        : [],
                                  ),
                                ),
                              );
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              heightBox(10),
              TextConstant(
                fontSize: 24,
                title: productData['name'],
                fontWeight: FontWeight.w600,
              ),
              heightBox(10),
              Row(
                children: [
                  TextConstant(
                    fontWeight: FontWeight.w400,
                    title: '\$${productData['Price']}',
                  ),
                  widthBox(20),
                  TextConstant(
                    fontWeight: FontWeight.w400,
                    title: '\$${productData['RealPrice']}',
                    textDecoration: TextDecoration.lineThrough,
                    color: themeController.greyColor.withValues(alpha: 0.5),
                    decorationColor: themeController.greyColor.withValues(
                      alpha: 0.5,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),

              SizedBox(height: 20.h),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: themeController.primaryColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  padding: EdgeInsets.symmetric(
                    horizontal: 50.w,
                    vertical: 15.h,
                  ),
                ),
                child: TextConstant(
                  title: 'Add to Cart',
                  fontSize: 16.sp,
                  color: themeController.whiteColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
