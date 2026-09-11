import 'package:get/get.dart';

import '../controllers/ablution_controller.dart';

class AblutionBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AblutionController>(
      () => AblutionController(),
    );
  }
}