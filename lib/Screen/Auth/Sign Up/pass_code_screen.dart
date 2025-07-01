import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Screen/Auth/Sign%20Up/Controller/location_controller.dart';

class PassCodeScreen extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());
  PassCodeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = ThemeController();

    return Scaffold(
      backgroundColor: themeController.whiteColor,
      appBar: commonAppbar(
        title: '',
        elevation: 0,
        themeController: themeController,
      ),
      body: screenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox(30),
            TextConstant(
              fontSize: 20.sp,
              title: "Set your password",
              fontWeight: FontWeight.bold,
            ),
            heightBox(10),
            TextConstant(
              softWrap: true,
              fontSize: 12.sp,
              color: themeController.greyColor.withValues(alpha: 0.6),
              title:
                  "We use state-of-the-art security measures to protect your information at all times.",
            ),
            heightBox(40),
            Obx(
              () => Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(6, (index) {
                  bool isFilled =
                      index < locationController.enteredCode.value.length;
                  return Container(
                    width: 45.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: isFilled
                            ? themeController.primaryColor
                            : themeController.greyColor.withValues(alpha: 0.4),
                      ),
                      borderRadius: BorderRadius.circular(8.r),
                    ),
                    child: Center(
                      child: TextConstant(
                        fontSize: 24.sp,
                        fontWeight: FontWeight.bold,
                        title: isFilled
                            ? locationController.enteredCode.value[index]
                            : '',
                      ),
                    ),
                  );
                }),
              ),
            ),
            heightBox(60),
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: locationController.confirmCode,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: themeController.primaryColor,
                  foregroundColor: themeController.blackColor,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: TextConstant(
                  fontSize: 18.sp,
                  title: 'Confirm',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            heightBox(60),
            buildNumericKeypad(),
          ],
        ),
      ),
    );
  }

  Widget buildNumericKeypad() {
    final keys = [
      ['1', '2', '3'],
      ['4', '5', '6'],
      ['7', '8', '9'],
      ['*', '0', '⌫'],
    ];

    return Column(
      children: List.generate(keys.length, (rowIndex) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(keys[rowIndex].length, (colIndex) {
            String key = keys[rowIndex][colIndex];
            return buildKeypadButton(key, isBackspace: key == '⌫');
          }),
        );
      }),
    );
  }

  Widget buildKeypadButton(String text, {bool isBackspace = false}) {
    return GestureDetector(
      onTap: () {
        if (isBackspace) {
          locationController.removeDigit();
        } else {
          locationController.addDigit(text);
        }
      },
      child: Container(
        width: 60.w,
        height: 60.h,
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        child: Center(
          child: TextConstant(title: text, fontSize: 28.sp),
        ),
      ),
    );
  }
}
