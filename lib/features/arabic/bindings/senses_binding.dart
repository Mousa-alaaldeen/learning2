import 'package:get/get.dart';

import '../controllers/senses_controller.dart';

class SensesBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SensesController>(
      () => SensesController(),
    );
  }
}