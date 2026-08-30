import 'package:get/get.dart';
import 'package:test1/features/home/bindings/home_binding.dart';
import 'package:test1/features/home/views/home_screen.dart';

class WelcomeController extends GetxController {
  void startLearning() {
    Get.off(
      () => const HomeScreen(),
      binding: HomeBinding(),
    );
  }
}