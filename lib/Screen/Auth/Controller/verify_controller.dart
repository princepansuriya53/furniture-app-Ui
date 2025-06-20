import 'package:flutter/material.dart';
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
      // Handle verification logic here
      Get.snackbar(
        'Success',
        'Code verified: ${enteredCode.value}',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    } else {
      Get.snackbar(
        'Error',
        'Please enter complete 6-digit code',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  void resendCode() {
    enteredCode.value = '';
    resendTimer.value = 60;
    Get.snackbar(
      'Code Sent',
      'Verification code has been resent',
      backgroundColor: Colors.blue,
      colorText: Colors.white,
    );
  }
}
