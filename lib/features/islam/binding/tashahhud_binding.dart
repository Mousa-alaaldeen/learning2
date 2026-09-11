
import 'package:get/get.dart';

import '../controllers/tashahhud_controller.dart';

class TashahhudBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TashahhudController>(
      () => TashahhudController(),
    );
  }
}
