import 'package:get/get.dart';

import '../controllers/exams_controller.dart';

class ExamsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExamsController>(
      () => ExamsController(),
    );
  }
}