import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Screen/Home%20Screen/home_screen.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get.dart';

class BiometricScreen extends StatelessWidget {
  const BiometricScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = ThemeController();

    return Scaffold(
      appBar: commonAppbar(
        title: '',
        themeController: themeController,
        elevation: 0,
      ),
      body: screenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox(20),
            TextConstant(
              fontSize: 30,
              fontWeight: FontWeight.w600,
              title: 'Enable Fingerprint\nlock',
              color: themeController.blackColor,
            ),
            heightBox(12),
            TextConstant(
              fontSize: 12,
              color: themeController.greyColor.withValues(alpha: 0.7),
              title:
                  'Login quickly and securely with the fingerprint stored\non this device.',
            ),
            Spacer(),
            Center(
              child: Icon(
                size: 100.sp,
                Icons.fingerprint_rounded,
                color: themeController.blackColor,
              ),
            ),
            const Spacer(),
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: elevatedButton(
                title: 'Enable',
                onPressed: () {
                  Get.to(() => HomeScreen());
                },
              ),
            ),
            heightBox(16),
            Center(
              child: TextButton(
                onPressed: () {
                  Get.to(() => HomeScreen());
                },
                child: TextConstant(
                  fontSize: 16,
                  title: "I'll do it later",
                  color: Colors.black87,
                  textDecoration: TextDecoration.underline,
                ),
              ),
            ),
            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }
}
