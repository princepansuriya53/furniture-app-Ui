import 'package:furniture_app/Constants/app_assets.dart';
import 'package:get/get.dart';

class LayoutController extends GetxController {
  var items = <Map<String, String>>[
    {'name': 'Bedroom', 'image': AppAssets.BedRoom},
    {'name': 'Sofa', 'image': AppAssets.Kitchen},
    {'name': 'Chair', 'image': AppAssets.Dinning},
    {'name': 'Table', 'image': AppAssets.Living},
  ].obs;
}
