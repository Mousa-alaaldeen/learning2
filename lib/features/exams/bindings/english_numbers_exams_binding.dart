import 'package:get/get.dart';

import '../controllers/english_numbers_exam_controller.dart';

class EnglishNumbersExamsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishNumbersExamController>(
      () => EnglishNumbersExamController(),
    );
  }
}