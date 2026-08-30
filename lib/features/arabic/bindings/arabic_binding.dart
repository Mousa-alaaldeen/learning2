import 'package:get/get.dart';

import '../controllers/arabic_controller.dart';
import '../controllers/letter_controller.dart';
import '../controllers/number_controller.dart';

class ArabicBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ArabicController>(() => ArabicController());
    Get.lazyPut<LetterController>(() => LetterController());
    Get.lazyPut<NumberController>(() => NumberController());
  }
}
