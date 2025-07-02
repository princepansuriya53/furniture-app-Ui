import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:furniture_app/Global/globel_use.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Screen/Layout%20Screen/Controller/layout_controller.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});

  final ThemeController themeController = Get.find<ThemeController>();
  final LayoutController layoutController = Get.put(LayoutController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.whiteColor,
      body: screenPadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
              TextConstant(
                fontSize: 22,
                title: 'Shop By Room',
                fontWeight: FontWeight.w500,
              ),
              heightBox(15),
              Obx(
                () => GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: layoutController.items.length,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 15.h,
                    crossAxisSpacing: 15.w,
                    childAspectRatio: 0.8,
                  ),
                  itemBuilder: (context, index) {
                    final item = layoutController.items[index];
                    return Stack(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            image: DecorationImage(
                              image: AssetImage(item['image'] ?? ''),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          height: 80.h,
                          padding: EdgeInsets.only(left: 10.w, top: 5.h),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.r),
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                themeController.blackColor.withValues(
                                  alpha: 0.5,
                                ),
                                Colors.transparent,
                              ],
                            ),
                          ),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: TextConstant(
                              fontSize: 20,
                              title: item['name'] ?? '',
                              fontWeight: FontWeight.w500,
                              color: themeController.whiteColor,
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
