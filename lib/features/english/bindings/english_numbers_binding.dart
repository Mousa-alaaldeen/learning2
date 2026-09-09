import 'package:get/get.dart';

import '../controllers/english_numbers_controller.dart';

class EnglishNumbersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishNumbersController>(
      () => EnglishNumbersController(),
    );
  }
}