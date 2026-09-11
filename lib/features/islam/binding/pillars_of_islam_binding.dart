import 'package:get/get.dart';

import '../controllers/pillars_of_islam_controller.dart';

class PillarsOfIslamBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PillarsOfIslamController>(
      () => PillarsOfIslamController(),
    );
  }
}
