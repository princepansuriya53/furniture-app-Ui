import 'package:flutter/material.dart';
import 'package:furniture_app/Screen/Auth/Sign%20Up/congo_screen.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

class LocationController extends GetxController {
  var latitude = 0.0.obs;
  var longitude = 0.0.obs;
  var address = ''.obs;
  var errorMessage = ''.obs;
  var isLoading = false.obs;
  var hasLocation = false.obs;
  var enteredCode = ''.obs;

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
      Get.offAll(() => CongoScreen());
    } else {
      Get.snackbar(
        'Error',
        colorText: Colors.white,
        backgroundColor: Colors.red,
        'Please enter complete 6-digit code',
      );
    }
  }

  Future<void> getCurrentLocation() async {
    try {
      isLoading.value = true;
      errorMessage.value = '';

      PermissionStatus permission = await Permission.location.request();
      if (permission.isDenied || permission.isPermanentlyDenied) {
        errorMessage.value = 'Location permission denied';
        isLoading.value = false;
        return;
      }

      // Service check
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        errorMessage.value = 'Location services are disabled';
        isLoading.value = false;
        return;
      }

      // Get location
      Position position = await Geolocator.getCurrentPosition(
        locationSettings: AppleSettings(accuracy: LocationAccuracy.high),
      );

      latitude.value = position.latitude;
      longitude.value = position.longitude;
      hasLocation.value = true;

      List<Placemark> placemarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      if (placemarks.isNotEmpty) {
        final place = placemarks.first;
        address.value =
            '${place.name}, ${place.locality}, ${place.subAdministrativeArea}, '
            '${place.administrativeArea}, ${place.postalCode}, ${place.country}';
      } else {
        address.value = 'Lat: ${latitude.value}, Lng: ${longitude.value}';
      }

      Get.snackbar(
        'Success',
        colorText: Colors.white,
        backgroundColor: Colors.green,
        'Location retrieved successfully!',
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (e) {
      errorMessage.value = 'Error getting location: $e';
      Get.snackbar(
        'Error',
        'Failed to get location: $e',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } finally {
      isLoading.value = false;
    }
  }

  void clearLocation() {
    latitude.value = 0.0;
    longitude.value = 0.0;
    address.value = '';
    hasLocation.value = false;
    errorMessage.value = '';
  }
}
