import 'package:get/get.dart';

import '../controllers/english_writing_controller.dart';

class EnglishWritingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishWritingController>(
      () => EnglishWritingController(),
    );
  }
}