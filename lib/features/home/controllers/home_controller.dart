import 'package:get/get.dart';
import 'package:test1/component/ads/interstitial_ad.dart';
import 'package:test1/screen/exam/exam_layout.dart';
import '../../../app/routes/app_routes.dart';


class HomeController extends GetxController {
  void openArabic() {
    Get.toNamed(AppRoutes.arabic);
  }

  void openEnglish() {
    Get.toNamed(AppRoutes.english);
  }

  void openScience() {
    Get.toNamed(AppRoutes.science);
  }

void openIslam() {
  Get.toNamed(AppRoutes.islam);
}


  void openExams() {
    Get.toNamed(AppRoutes.exams);
  }
}
