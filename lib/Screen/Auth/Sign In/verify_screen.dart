import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'Controller/verify_controller.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VerificationScreen extends StatelessWidget {
  final VerificationController controller = Get.put(VerificationController());

  VerificationScreen({super.key});

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
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox(50),
            TextConstant(
              fontSize: 18.sp,
              title: "Verify it's you",
              fontWeight: FontWeight.bold,
            ),
            heightBox(8),
            TextConstant(
              fontSize: 12.sp,
              color: themeController.greyColor.withValues(alpha: 0.5),
              title:
                  "We have sent a verification code to your email,\nplease enter the code below.",
            ),
            heightBox(40),
            Center(
              child: Obx(
                () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(6, (index) {
                    bool isFilled = index < controller.enteredCode.value.length;
                    return Container(
                      width: 45.w,
                      height: 45.h,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: isFilled
                              ? themeController.primaryColor
                              : themeController.greyColor.withValues(
                                  alpha: 0.4,
                                ),
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: TextConstant(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold,
                          title: isFilled
                              ? controller.enteredCode.value[index]
                              : '',
                        ),
                      ),
                    );
                  }),
                ),
              ),
            ),
            heightBox(20),
            Center(
              child: Obx(
                () => TextConstant(
                  fontSize: 14,
                  color: themeController.greyColor.withValues(alpha: 0.6),
                  title:
                      "You can resend the code after 1 minute ( 00:${controller.resendTimer.value.toString().padLeft(2, '0')} )",
                ),
              ),
            ),
            heightBox(40),
            SizedBox(
              height: 50.h,
              width: double.infinity,
              child: ElevatedButton(
                onPressed: controller.confirmCode,
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
            Spacer(),
            buildNumericKeypad(),
            heightBox(20),
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
          controller.removeDigit();
        } else {
          controller.addDigit(text);
        }
      },
      child: Container(
        width: 80.w,
        height: 60.h,
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
        child: Center(
          child: TextConstant(title: text, fontSize: 28.sp),
        ),
      ),
    );
  }
}
