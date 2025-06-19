import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Screen/onBoarding/Controller/slider_controller.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/route_manager.dart';
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
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.asset(
          item.imagePath,
          width: Get.width,
          height: Get.height,
          fit: BoxFit.fill,
          errorBuilder: (context, error, stackTrace) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white.withValues(alpha: 0.2),
              ),
              child: const Icon(Icons.image, size: 100, color: Colors.white),
            );
          },
        ),
        Positioned(
          top: 100.h,
          left: 25.w,
          child: Text(
            item.title,
            style: GoogleFonts.robotoFlex(
              height: 0,
              fontSize: 40.sp,
              fontWeight: FontWeight.w500,
              shadows: [BoxShadow(blurRadius: 1, offset: Offset(1.5, 1.5))],
            ),
          ),
        ),
        Positioned(
          top: 200.h,
          left: 25.w,
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width / .5,
            child: TextConstant(
              maxLines: 4,
              fontSize: 15.sp,
              title: item.description,
              color: ThemeController().whiteColor,
            ),
          ),
        ),
        Positioned(top: 250.h, left: 25.w, child: buildPageIndicator()),
        Align(
          alignment: Alignment.bottomCenter,
          child: Image.asset(
            fit: BoxFit.fill,
            width: Get.width,
            height: Get.height,
            AppAssets.imageShadow,
          ),
        ),
        Padding(
          padding: EdgeInsets.only(bottom: 100.h),
          child: Align(
            alignment: Alignment.bottomCenter,
            child: buildNextButton(context),
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
              color: controller.currentIndex.value == index
                  ? ThemeController().primaryColor.value
                  : Colors.white,
              shape: BoxShape.circle,
            ),
          ),
        ),
      ),
    );
  }

  Widget buildNextButton(BuildContext context) {
    return Obx(
      () => SizedBox(
        width: MediaQuery.sizeOf(context).width / 1.1,
        child:
            controller.currentIndex.value ==
                controller.onboardingItems.length - 1
            ? ElevatedButton(
                onPressed: controller.nextPage,
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.black,
                  backgroundColor: const Color(0xFFFFC107),
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 0,
                ),
                child: TextConstant(
                  fontSize: 16,
                  title: 'Get started',
                  fontWeight: FontWeight.w600,
                ),
              )
            : GestureDetector(
                onTap: controller.nextPage,
                child: Container(
                  width: 56,
                  height: 56,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFFC107),
                  ),
                  child: const Icon(size: 24, Icons.arrow_forward),
                ),
              ),
      ),
    );
  }
}
