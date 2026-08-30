import 'package:get/get.dart';

import '../controllers/letter_controller.dart';

class LetterBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<LetterController>(
      () => LetterController(),
    );
  }
}