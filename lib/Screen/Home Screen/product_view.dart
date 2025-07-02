import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Screen/Home%20Screen/Screen/review_screen.dart';
import 'package:furniture_app/Screen/Home%20Screen/Controller/home_controller.dart';

class ProductView extends StatelessWidget {
  final Map<String, dynamic> productData;

  ProductView({super.key, required this.productData});

  final ThemeController themeController = Get.find<ThemeController>();
  final HomeController homeController = Get.put(HomeController());
  @override
  Widget build(BuildContext context) {
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
              heightBox(10),
              Container(
                height: 50.h,
                padding: EdgeInsets.symmetric(horizontal: 5.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: themeController.GreayColor.withValues(alpha: 0.2),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.star_outlined,
                          color: themeController.primaryColor,
                        ),
                        widthBox(8),
                        TextConstant(
                          fontWeight: FontWeight.bold,
                          title: productData['Ratings'],
                        ),
                        widthBox(5),
                        TextConstant(
                          title: 'Ratings',
                          color: themeController.greyColor,
                        ),
                      ],
                    ),
                    InkWell(
                      onTap: () {
                        Get.to(
                          transition: Transition.rightToLeft,
                          duration: Duration(milliseconds: 500),
                          () => ReviewScreen(productData: productData),
                        );
                      },
                      child: Row(
                        children: [
                          TextConstant(title: productData['Reviews']),
                          widthBox(5),
                          TextConstant(
                            title: "Reviews",
                            color: themeController.greyColor,
                          ),
                          widthBox(10),
                          Icon(size: 15.sp, Icons.arrow_forward_ios),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              heightBox(20),
              TextConstant(
                fontSize: 20,
                title: 'Description',
                fontWeight: FontWeight.w600,
              ),
              heightBox(10),
              TextConstant(
                softWrap: true,
                title: productData['Description'],
                color: themeController.blackColor.withValues(alpha: 0.4),
              ),
              heightBox(20),
              elevatedButton(
                title: 'Add to cart',
                onPressed: () {
                  showCustomBottomSheet(
                    title: 'Item successfully added!',
                    themeController,
                    children: [
                      heightBox(20),
                      elevatedButton(
                        onPressed: () {
                          Get.back();
                        },
                        title: 'Continue shopping',
                      ),
                      heightBox(20),
                      elevatedButton(
                        isBorder: true,
                        onPressed: () {
                          Get.back();
                        },
                        title: 'View cart',
                        backGroundColor: themeController.whiteColor,
                      ),
                      heightBox(20),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
