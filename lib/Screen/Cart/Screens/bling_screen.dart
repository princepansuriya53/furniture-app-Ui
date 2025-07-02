import 'package:flutter/material.dart';
import 'package:flutter_dash/flutter_dash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Global/globel_use.dart';
import 'package:furniture_app/Screen/Cart/Screens/payed_screen.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get.dart';

class BlingScreen extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();
  BlingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: 'BlingScreen',
        themeController: themeController,
      ),
      body: screenPadding(
        child: Column(
          children: [
            heightBox(80),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConstant(
                  title: 'Sub total',
                  fontWeight: FontWeight.w600,
                  color: themeController.greyColor,
                ),
                TextConstant(
                  fontSize: 15,
                  title: '\$239.00',
                  fontWeight: FontWeight.w600,
                  color: themeController.blackColor.withValues(alpha: 0.7),
                ),
              ],
            ),
            heightBox(10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConstant(
                  title: 'Shipping fee',
                  fontWeight: FontWeight.w600,
                  color: themeController.greyColor,
                ),
                TextConstant(
                  fontSize: 15,
                  title: '\$25.99',
                  fontWeight: FontWeight.w600,
                  color: themeController.blackColor.withValues(alpha: 0.7),
                ),
              ],
            ),
            heightBox(20),
            Flexible(
              child: Dash(
                dashLength: 5,
                length: baseWidth / 1.2,
                direction: Axis.horizontal,
                dashColor: themeController.greyColor,
              ),
            ),
            heightBox(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConstant(
                  fontSize: 12,
                  title: 'Promo code',
                  fontWeight: FontWeight.w600,
                  color: themeController.greyColor,
                ),
                elevatedButton(
                  height: 25.h,
                  width: 80.w,
                  title: 'Apply',
                  fontSize: 12,
                  onPressed: () {},
                  borderRadius: BorderRadius.circular(5.r),
                ),
              ],
            ),
            heightBox(20),
            Dash(
              dashLength: 5,
              length: baseWidth / 1.2,
              direction: Axis.horizontal,
              dashColor: themeController.greyColor,
            ),

            heightBox(20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextConstant(
                  fontSize: 12,
                  title: 'Total',
                  fontWeight: FontWeight.w600,
                  color: themeController.greyColor,
                ),
                TextConstant(
                  fontSize: 15,
                  title: '\$260.99',
                  fontWeight: FontWeight.w600,
                  color: themeController.blackColor.withValues(alpha: 0.7),
                ),
              ],
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
        child: elevatedButton(
          title: 'Proceed to Pay',
          onPressed: () => Get.to(() => PayedScreen()),
        ),
      ),
    );
  }
}
