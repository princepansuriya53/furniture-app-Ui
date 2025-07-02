import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationsScreen extends StatelessWidget {
  NotificationsScreen({super.key});
  final ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.whiteColor,
      body: screenPadding(
        child: Column(
          children: [
            heightBox(50),
            ListTile(
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: themeController.primaryColor.withValues(
                  alpha: 0.2,
                ),
                child: SvgPicture.asset(
                  AppAssets.DiscountIcon,
                  height: 22.h,
                  width: 22.w,
                ),
              ),
              title: TextConstant(
                fontSize: 15,
                softWrap: true,
                title: 'Additional 10% discount on pre bookings',
              ),
            ),
            heightBox(50),
            ListTile(
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: themeController.primaryColor.withValues(
                  alpha: 0.2,
                ),
                child: Icon(
                  size: 22.h,
                  Icons.shopping_bag_outlined,
                  color: themeController.blackColor,
                ),
              ),
              title: TextConstant(
                fontSize: 15,
                softWrap: true,
                title: 'A reminder to checkout on your cart items.',
              ),
            ),
            heightBox(50),
            ListTile(
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: themeController.primaryColor.withValues(
                  alpha: 0.2,
                ),
                child: SvgPicture.asset(
                  AppAssets.InviteIcons,
                  height: 22.h,
                  width: 22.w,
                ),
              ),
              title: TextConstant(
                fontSize: 15,
                softWrap: true,
                title:
                    'Invite your friend and get \$10 voucher for your next  purchase.',
              ),
            ),
            heightBox(50),
            ListTile(
              leading: CircleAvatar(
                radius: 20.r,
                backgroundColor: themeController.primaryColor.withValues(
                  alpha: 0.2,
                ),
                child: Icon(
                  size: 22.h,
                  LucideIcons.ticket,
                  color: themeController.blackColor,
                ),
              ),
              title: TextConstant(
                fontSize: 15,
                softWrap: true,
                title: 'Additional 10% discount on new arrivals.',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
