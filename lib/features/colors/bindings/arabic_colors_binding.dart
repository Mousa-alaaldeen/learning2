import 'package:get/get.dart';

import '../controllers/arabic_colors_controller.dart';

class ArabicColorsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArabicColorsController>(
      () => ArabicColorsController(),
    );
  }
}
