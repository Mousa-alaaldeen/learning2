import 'package:get/get.dart';

import '../controllers/english_colors_controller.dart';

class EnglishColorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishColorsController>(
      () => EnglishColorsController(),
    );
  }
}