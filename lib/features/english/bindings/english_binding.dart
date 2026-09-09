import 'package:get/get.dart';

import '../controllers/english_controller.dart';

class EnglishBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishController>(
      () => EnglishController(),
    );
  }
}