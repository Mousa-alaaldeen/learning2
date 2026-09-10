import 'package:get/get.dart';

import '../controllers/english_senses_controller.dart';

class EnglishSensesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishSensesController>(
      () => EnglishSensesController(),
    );
  }
}