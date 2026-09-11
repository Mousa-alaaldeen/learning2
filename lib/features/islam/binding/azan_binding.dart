
import 'package:get/get.dart';

import '../controllers/azan_controller.dart';

class AzanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AzanController>(
      () => AzanController(),
    );
  }
}
