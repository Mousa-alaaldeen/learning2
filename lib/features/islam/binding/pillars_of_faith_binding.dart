import 'package:get/get.dart';

import '../controllers/pillars_of_faith_controller.dart';

class PillarsOfFaithBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PillarsOfFaithController>(
      () => PillarsOfFaithController(),
    );
  }
}