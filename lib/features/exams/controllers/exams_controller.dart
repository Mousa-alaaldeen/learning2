import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';


class ExamsController extends GetxController {
  void openArabicNumbers() {
      Get.toNamed(AppRoutes.arabicNumbersExams);
  }

  void openEnglishNumbers() {
     Get.toNamed(AppRoutes.englishWritingNumbers);

  }
  void openArabicLetters() {
     Get.toNamed(AppRoutes.englishWritingNumbers);
  }

  void openEnglishLetters() {
     Get.toNamed(AppRoutes.englishWritingNumbers);
  }
}