import 'package:get/get.dart';

import '../controllers/english_letters_controller.dart';

class EnglishLettersBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishLettersController>(
      () => EnglishLettersController(),
    );
  }
}