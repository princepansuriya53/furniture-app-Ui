import 'package:flutter/material.dart';
import 'package:furniture_app/Screen/Auth/Sign%20In/biometric_screen.dart';
import 'package:get/get.dart';

class VerificationController extends GetxController {
  var enteredCode = ''.obs;
  var resendTimer = 60.obs;

  void addDigit(String digit) {
    if (enteredCode.value.length < 6) {
      enteredCode.value = enteredCode.value + digit;
    }
  }

  void removeDigit() {
    if (enteredCode.value.isNotEmpty) {
      enteredCode.value = enteredCode.value.substring(
        0,
        enteredCode.value.length - 1,
      );
    }
  }

  void confirmCode() {
    if (enteredCode.value.length == 6) {
      Get.snackbar(
        'Success',
        colorText: Colors.white,
        backgroundColor: Colors.green,
        'Code verified: ${enteredCode.value}',
      );
      Get.to(() => BiometricScreen());
    } else {
      Get.snackbar(
        'Error',
        colorText: Colors.white,
        backgroundColor: Colors.red,
        'Please enter complete 6-digit code',
      );
    }
  }

  void resendCode() {
    enteredCode.value = '';
    resendTimer.value = 60;
    Get.snackbar(
      'Code Sent',
      colorText: Colors.white,
      backgroundColor: Colors.blue,
      'Verification code has been resent',
    );
  }
}
