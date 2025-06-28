import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:furniture_app/Global/globel_use.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LayoutScreen extends StatelessWidget {
  LayoutScreen({super.key});
  final ThemeController themeController = ThemeController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              
              Stack(
                children: [
                  Container(
                    height: 210.h,
                    width: 160.w,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(AppAssets.BedRoom),
                      ),
                    ),
                  ),
                  Container(
                    height: 80.h,
                    width: 160.w,
                    padding: EdgeInsets.only(left: 10.w, top: 5.h),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          themeController.blackColor.withValues(alpha: 0.5),
                          Colors.transparent,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: TextConstant(
                      fontSize: 20,
                      title: 'Bedroom',
                      fontWeight: FontWeight.w500,
                      color: themeController.whiteColor,
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
