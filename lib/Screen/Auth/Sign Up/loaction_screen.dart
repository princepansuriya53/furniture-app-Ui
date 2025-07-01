import 'package:furniture_app/Screen/Auth/Sign%20Up/pass_code_screen.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:furniture_app/Screen/Auth/Sign%20Up/Controller/location_controller.dart';

class LocationScreen extends StatelessWidget {
  final LocationController locationController = Get.put(LocationController());

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
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            heightBox(35),
            TextConstant(title: 'Location accesss', fontSize: 30),
            heightBox(30),
            TextConstant(
              fontSize: 14,
              softWrap: true,
              fontWeight: FontWeight.w300,
              title:
                  'Arino needs to know your location in order to give you better shopping and delivery experience.',
            ),
            heightBox(40),
            Obx(() {
              return locationController.isLoading.value
                  ? Center(child: loader(themeController: themeController))
                  : Center(
                      child: IconButton.outlined(
                        style: ButtonStyle(
                          side: WidgetStatePropertyAll(BorderSide(width: 3)),
                          backgroundColor: WidgetStatePropertyAll(
                            themeController.primaryColor,
                          ),
                        ),
                        onPressed: locationController.isLoading.value
                            ? null
                            : locationController.getCurrentLocation,
                        icon: Icon(size: 90.sp, CupertinoIcons.location_solid),
                      ),
                    );
            }),
            heightBox(60),
            Obx(
              () => locationController.hasLocation.value
                  ? Container(
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.r),
                        border: Border.all(
                          color: themeController.blackColor.withValues(
                            alpha: 0.1,
                          ),
                        ),
                        color: themeController.greyColor.withValues(alpha: 0.3),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextConstant(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            title: '📍 Your Current Address',
                          ),
                          heightBox(10),
                          TextConstant(
                            fontSize: 14,
                            softWrap: true,
                            title: locationController.address.value,
                          ),
                          heightBox(10),
                          TextConstant(
                            fontSize: 12,
                            softWrap: true,
                            color: themeController.greyColor,
                            title:
                                'Updated at: ${DateTime.now().toString().substring(0, 19)}',
                          ),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
            ),
            heightBox(20),
            Obx(
              () => locationController.hasLocation.value
                  ? elevatedButton(
                      title: 'Clear Location',
                      backGroundColor: themeController.ErrorColor,
                      foregroundColor: themeController.whiteColor,
                      onPressed: locationController.clearLocation,
                    )
                  : SizedBox.shrink(),
            ),
            Obx(
              () => locationController.errorMessage.value.isNotEmpty
                  ? Container(
                      margin: EdgeInsets.only(top: 20),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                        color: themeController.ErrorColor.withValues(
                          alpha: 0.1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: themeController.ErrorColor.withValues(
                            alpha: 0.5,
                          ),
                        ),
                      ),
                      child: Row(
                        children: [
                          Icon(
                            Icons.error_outline,
                            color: themeController.ErrorColor,
                          ),
                          widthBox(10),
                          Expanded(
                            child: TextConstant(
                              color: themeController.ErrorColor,
                              title: locationController.errorMessage.value,
                            ),
                          ),
                        ],
                      ),
                    )
                  : SizedBox.shrink(),
            ),
            heightBox(30),
            Obx(
              () => locationController.hasLocation.value
                  ? elevatedButton(
                      title: 'Confirm',
                      onPressed: () {
                        Get.to(() => PassCodeScreen());
                      },
                    )
                  : SizedBox.shrink(),
            ),
          ],
        ),
      ),
    );
  }
}
