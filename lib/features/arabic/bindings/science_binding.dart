import 'package:get/get.dart';

import '../../science/controllers/science_controller.dart';
import '../../science/controllers/animal_controller.dart';

class ScienceBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ScienceController>(() => ScienceController());
    Get.lazyPut<AnimalController>(() => AnimalController());
  }
}