
import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';

class ArabicController extends GetxController {
  void openLetters() {
    Get.toNamed(AppRoutes.arabicLetters);
  }

  void openNumbers() {
    Get.toNamed(AppRoutes.arabicNumbers);
  }

  void openWriting() {
    Get.toNamed(AppRoutes.arabicWriting);
  }

  void openSenses() {
    Get.toNamed(AppRoutes.arabicSenses);
  }
}
