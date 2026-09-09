import 'package:get/get.dart';

import '../controllers/english_week_days_controller.dart';

class EnglishWeekDaysBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EnglishWeekDaysController>(
      () => EnglishWeekDaysController(),
    );
  }
}