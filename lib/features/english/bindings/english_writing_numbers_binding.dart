import 'package:get/get.dart';

import '../controllers/english_writing_numbers_controller.dart';

class EnglishWritingNumbersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishWritingNumbersController>(
      () => EnglishWritingNumbersController(),
    );
  }
}