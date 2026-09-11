import 'package:get/get.dart';

import '../controllers/arabic_numbers_exam_controller.dart';

class ArabicNumbersExamsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArabicNumbersExamController>(
      () => ArabicNumbersExamController(),
    );
  }
}