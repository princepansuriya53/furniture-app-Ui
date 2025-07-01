import 'package:flutter/material.dart';
import 'package:furniture_app/Common/widget_constant.dart';
import 'package:furniture_app/Screen/Home%20Screen/Controller/home_controller.dart';
import 'package:furniture_app/Theme/theme_controller.dart';
import 'package:get/get.dart';
import 'package:lucide_icons/lucide_icons.dart';
import 'package:qr_code_scanner_plus/qr_code_scanner_plus.dart';

class ProductScanner extends StatelessWidget {
  ProductScanner({super.key});
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  final HomeController homeController = Get.find<HomeController>();
  final ThemeController themeController = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: themeController.whiteColor,
      appBar: commonAppbar(
        title: 'Scan Product',
        themeController: themeController,
        backgroundColor: themeController.primaryColor,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(LucideIcons.flashlight),
        onPressed: () => homeController.qrController.toggleFlash(),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: QRView(
              key: qrKey,
              onQRViewCreated: (controller) {
                homeController.qrController = controller;
                homeController.startScanning();
              },
              overlay: QrScannerOverlayShape(
                borderWidth: 5,
                borderRadius: 10,
                borderLength: 30,
                cutOutBottomOffset: BorderSide.strokeAlignOutside,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
