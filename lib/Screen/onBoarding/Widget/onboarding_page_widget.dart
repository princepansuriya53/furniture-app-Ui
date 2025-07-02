import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Screen/onBoarding/Controller/slider_controller.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class OnboardingPage extends StatelessWidget {
  final OnboardingItem item;
  final OnboardingController controller;

  const OnboardingPage({
    super.key,
    required this.item,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Stack(
      children: [
        Stack(
          alignment: Alignment.bottomCenter,
          children: [
            Container(
              width: Get.width,
              height: Get.height,
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: AssetImage(item.imagePath),
                ),
              ),
            ),
            Container(
              height: 350,
              width: Get.width,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    themeController.blackColor.withValues(alpha: 0.9),
                    themeController.blackColor.withValues(alpha: 0.3),
                    themeController.blackColor.withValues(alpha: 0.01),
                  ],
                ),
              ),
            ),
          ],
        ),

        Container(
          width: Get.width,
          height: Get.height,
          padding: EdgeInsets.fromLTRB(20.w, 110.h, 20.h, 80.h),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                item.title,
                style: GoogleFonts.robotoFlex(
                  height: 0,
                  fontSize: 40.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              heightBox(10),
              TextConstant(
                softWrap: true,
                fontSize: 15.sp,
                title: item.description,
                color: ThemeController().whiteColor,
              ),
              heightBox(10),
              Align(
                alignment: Alignment.centerLeft,
                child: buildPageIndicator(),
              ),
              Spacer(),
              Center(child: buildNextButton(context)),
            ],
          ),
        ),
      ],
    );
  }

  Widget buildPageIndicator() {
    return Obx(
      () => Row(
        children: List.generate(
          controller.onboardingItems.length,
          (index) => Container(
            height: 10.h,
            margin: EdgeInsets.only(right: 2.w),
            width: controller.currentIndex.value == index ? 24.w : 20.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: controller.currentIndex.value == index
                  ? ThemeController().secondaryColors.value
                  : ThemeController().whiteColor,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNextButton(BuildContext context) {
    final ThemeController themeController = Get.find<ThemeController>();
    return Obx(() {
      final isLast =
          controller.currentIndex.value ==
          controller.onboardingItems.length - 1;

      return AnimatedSwitcher(
        duration: const Duration(milliseconds: 500),
        transitionBuilder: (child, animation) =>
            ScaleTransition(scale: animation, child: child),
        child: isLast
            ? SizedBox(
                width: Get.width,
                child: screenPadding(
                  child: ElevatedButton(
                    onPressed: controller.nextPage,
                    key: const ValueKey('getStarted'),
                    style: ElevatedButton.styleFrom(
                      elevation: 2,
                      foregroundColor: themeController.blackColor,
                      backgroundColor: themeController.primaryColor,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                    ),
                    child: TextConstant(
                      fontSize: 16.sp,
                      title: 'Get started',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              )
            : GestureDetector(
                onTap: controller.nextPage,
                key: const ValueKey('nextButton'),
                child: Container(
                  width: 60,
                  height: 60,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFC107),
                  ),
                  child: Icon(size: 25.sp, Icons.arrow_forward),
                ),
              ),
      );
    });
  }
}
