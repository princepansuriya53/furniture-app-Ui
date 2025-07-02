import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Screen/Cart/Screens/bling_screen.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get.dart';

class PaymentMethod extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();
  PaymentMethod({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: 'Payment Method',
        themeController: themeController,
      ),
      body: screenPadding(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox(50),
            TextConstant(
              fontSize: 24,
              title: 'Payment method',
              fontWeight: FontWeight.w600,
            ),
            heightBox(50),
            Center(
              child: Column(
                children: [
                  Image.network(
                    'https://1000logos.net/wp-content/uploads/2023/03/Google-Pay-logo.png',
                    width: 150.w,
                    fit: BoxFit.contain,
                  ),
                  heightBox(50),
                  Image.network(
                    width: 150.w,
                    fit: BoxFit.contain,
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/b/b5/PayPal.svg/2560px-PayPal.svg.png',
                  ),
                  heightBox(50),
                  Image.network(
                    width: 150.w,
                    fit: BoxFit.contain,
                    'https://download.logo.wine/logo/Apple_Pay/Apple_Pay-Logo.wine.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 15.h),
        child: elevatedButton(
          title: 'Proceed to Pay',
          onPressed: () => Get.to(() => BlingScreen()),
        ),
      ),
    );
  }
}
