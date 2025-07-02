import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Screen/Cart/Screens/payment_method.dart';
import 'package:get/get.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:lucide_icons/lucide_icons.dart';

class AddressScreen extends StatelessWidget {
  final ThemeController themeController = Get.find<ThemeController>();
  AddressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppbar(
        title: 'Shipping Details',
        themeController: themeController,
      ),
      body: screenPadding(
        child: ListView.separated(
          itemCount: 10,
          separatorBuilder: (context, index) =>
              Divider(color: themeController.greyColor),
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () => Get.to(() => PaymentMethod()),
              child: ListTile(
                leading: SvgPicture.asset(AppAssets.CircularLocation),
                title: Row(
                  spacing: 10,
                  children: [
                    TextConstant(
                      title: 'Home',
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),

                    if (index == 2)
                      Container(
                        height: 24.h,
                        width: 55.w,
                        alignment: AlignmentDirectional.center,
                        child: TextConstant(title: 'Default', fontSize: 12),
                        decoration: BoxDecoration(
                          color: themeController.GreayColor,
                          borderRadius: BorderRadius.circular(6.r),
                        ),
                      ),
                  ],
                ),
                subtitle: TextConstant(
                  softWrap: true,
                  color: themeController.greyColor,
                  title: '61480 Sunbrook Park, PC 5679',
                ),
                trailing: Icon(LucideIcons.clipboardEdit),
              ),
            );
          },
        ),
      ),
    );
  }
}
