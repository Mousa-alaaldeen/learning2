import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class IslamController extends GetxController {
  void openPillarsOfIslam() {
    Get.toNamed(AppRoutes.pillarsOfIslam);
  }

  void openPillarsOfFaith() {
    Get.toNamed(AppRoutes.pillarsOfFaith);
  }

  void openAblution() {
    Get.toNamed(AppRoutes.ablution);
  }

  void openAzan() {
    Get.toNamed(AppRoutes.azan);
  }

  void openTashahhud() {
    Get.toNamed(AppRoutes.tashahhud);
  }
}
