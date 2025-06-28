import 'package:get/get.dart';
import 'package:furniture_app/Constants/app_assets.dart';

class LayoutController extends GetxController {
  final List<Map<String, String>> items = [
    {'name': 'Bedroom', 'image': AppAssets.BedRoom},
    {'name': 'Kitchen', 'image': AppAssets.Kitchen},
    {'name': 'Dining', 'image': AppAssets.Dinning},
    {'name': 'Living', 'image': AppAssets.Living},
    {'name': 'Minimal', 'image': AppAssets.Minimal},
    {'name': 'Modern', 'image': AppAssets.Modern},
    {'name': 'Classic', 'image': AppAssets.Classic},
    {'name': 'Styles', 'image': AppAssets.Stylish},
  ].obs;
}
