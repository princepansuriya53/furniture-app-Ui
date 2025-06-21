import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/Common/text_constant.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Constants/app_assets.dart';
import 'package:furniture_app/Theme/theme_controller.dart';

class CongoScreen extends StatelessWidget {
  const CongoScreen({super.key});

  @override
  Widget build(BuildContext context) {
    ThemeController themeController = ThemeController();
    return Scaffold(
      appBar: commonAppbar(
        title: '',
        elevation: 0,
        themeController: themeController,
      ),
      body: screenPadding(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            heightBox(200),
            TextConstant(
              fontSize: 25,
              title: 'Congratulations!',
              fontWeight: FontWeight.w900,
            ),
            heightBox(50),
            SvgPicture.asset(AppAssets.doneLogo),
            heightBox(50),
            SizedBox(
              width: MediaQuery.sizeOf(context).width / 1.1,
              child: TextConstant(
                fontSize: 13,
                softWrap: true,
                textAlign: TextAlign.center,
                color: themeController.greyColor.withValues(alpha: 0.5),
                title:
                    'Your has been successfully created. Please add further information to make your shopping\nbetter.',
              ),
            ),
            Spacer(),
          ],
        ),
      ),
    );
  }
}
