import 'package:get/get.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Common/textfield_constant.dart';
import 'package:furniture_app/Screen/Auth/Sign%20Up/congo_screen.dart';

class RegistrionScreen extends StatelessWidget {
  const RegistrionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = ThemeController();

    return Scaffold(
      appBar: commonAppbar(
        title: "",
        elevation: 0,
        themeController: themeController,
      ),

      body: screenPadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox(20),
              TextConstant(
                softWrap: true,
                fontSize: 30.sp,
                fontWeight: FontWeight.w500,
                title: 'Create your arino account',
              ),
              heightBox(15),
              TextFieldConstant(
                hintText: 'Email',
                prefixIcon: Icon(
                  LucideIcons.mail,
                  color: themeController.greyColor,
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
              heightBox(15),
              TextFieldConstant(
                hintText: 'Username',
                prefixIcon: Icon(
                  LucideIcons.user,
                  color: themeController.greyColor,
                ),
                textInputAction: TextInputAction.next,
                keyboardType: TextInputType.emailAddress,
              ),
              heightBox(15),
              TextFieldConstant(
                hintText: 'Password',
                prefixIcon: Icon(
                  LucideIcons.lock,
                  color: themeController.greyColor,
                ),
                suffixIcon: Icon(
                  LucideIcons.eyeOff,
                  color: themeController.greyColor,
                ),
                textInputAction: TextInputAction.done,
                keyboardType: TextInputType.visiblePassword,
              ),
              heightBox(40),
              InkWell(
                onTap: () {},
                child: TextConstant(
                  title: 'Forgot password?',
                  fontWeight: FontWeight.w700,
                ),
              ),
              heightBox(50),
              elevatedButton(
                title: 'Sign Up',
                onPressed: () {
                  Get.to(() => CongoScreen());
                },
              ),
              heightBox(30),
              Row(
                children: [
                  Expanded(
                    child: Divider(
                      endIndent: 15,
                      thickness: 0.4,
                      color: themeController.greyColor,
                    ),
                  ),
                  TextConstant(title: 'OR', color: themeController.greyColor),
                  Expanded(
                    child: Divider(
                      indent: 15,
                      thickness: 0.4,
                      color: themeController.greyColor,
                    ),
                  ),
                ],
              ),
              heightBox(40),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 56.h,
                    width: 156.w,
                    padding: EdgeInsets.all(15.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.3,
                        color: themeController.greyColor,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Image.asset(
                      height: 10.h,
                      width: 20.w,
                      AppAssets.googleLogo,
                    ),
                  ),
                  Container(
                    height: 56.h,
                    width: 156.w,
                    padding: EdgeInsets.all(15.h),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 0.3,
                        color: themeController.greyColor,
                      ),
                      borderRadius: BorderRadius.circular(12.r),
                    ),
                    child: Image.asset(
                      height: 10.h,
                      width: 20.w,
                      AppAssets.appleLogo,
                    ),
                  ),
                ],
              ),
              heightBox(40),
              Center(
                child: RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: themeController.greyColor,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: themeController.blackColor,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Get.back(),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
