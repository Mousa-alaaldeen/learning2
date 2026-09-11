import 'package:get/get.dart';

import '../controllers/islam_controller.dart';

class IslamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IslamController>(
      () => IslamController(),
    );
  }
}