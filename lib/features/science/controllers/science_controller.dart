import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class ScienceController extends GetxController {
  void openAnimalSounds() {
    Get.toNamed(AppRoutes.animalSounds);
  }

  void openSenses() {
    Get.toNamed(AppRoutes.arabicSenses);
  }

  void openPlants() {}

  void openSpace() {}
}