import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/textfield_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:lucide_icons/lucide_icons.dart';

class LognScreen extends StatelessWidget {
  const LognScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = ThemeController();
    return Scaffold(
      body: screenPadding(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              heightBox(150),
              TextConstant(
                fontSize: 30.sp,
                title: 'Hi there!',
                fontWeight: FontWeight.w500,
              ),
              TextConstant(
                color: themeController.greyColor,
                title: 'Welcome back, Sign in to your account',
              ),
              heightBox(80),
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
                hintText: 'Password',
                prefixIcon: Icon(
                  LucideIcons.lock,
                  color: themeController.greyColor,
                ),
                suffixIcon: Icon(
                  LucideIcons.eye,
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
              elevatedButton(title: 'Sign In', onPressed: () {}),
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
                    text: "Don't have an account? ",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: themeController.greyColor,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign up',
                        style: TextStyle(
                          fontSize: 15.sp,
                          fontWeight: FontWeight.bold,
                          color: themeController.blackColor,
                        ),
                        recognizer: TapGestureRecognizer()..onTap = () {},
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
