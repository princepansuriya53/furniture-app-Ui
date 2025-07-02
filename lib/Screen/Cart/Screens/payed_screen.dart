import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Screen/BottomScreen/bottom_nevi.dart';
import 'package:furniture_app/Screen/Cart/Screens/delivery_status.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/route_manager.dart';

class PayedScreen extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();
  PayedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screenPadding(
        child: Column(
          children: [
            heightBox(100),
            SvgPicture.asset(AppAssets.payedIcons, fit: BoxFit.contain),
            TextConstant(
              fontSize: 24,
              title: 'Payment successful',
              fontWeight: FontWeight.w600,
            ),
            TextConstant(
              fontSize: 12,
              softWrap: true,
              textAlign: TextAlign.center,
              fontWeight: FontWeight.w600,
              color: themeController.greyColor,
              title:
                  'Your order has been place\nand will be deliver to you shortly.',
            ),
            heightBox(50),
            elevatedButton(
              title: 'Track your parcel',
              onPressed: () {
                Get.to(() => DeliveryStatus());
              },
            ),
            heightBox(50),
            TextButton(
              onPressed: () {
                Get.offAll(() => MainScreen());
              },
              child: TextConstant(title: 'Home page'),
            ),
          ],
        ),
      ),
    );
  }
}
