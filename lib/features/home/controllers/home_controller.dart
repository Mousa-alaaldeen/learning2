import 'package:get/get.dart';
import 'package:test1/component/ads/interstitial_ad.dart';

import 'package:test1/screen/animal_screen.dart/animal_screen.dart';
import 'package:test1/screen/ar_screen/ar_screen.dart';
import 'package:test1/screen/colors/colora_screen.dart';
import 'package:test1/screen/en_screen/en_screen.dart';
import 'package:test1/screen/exam/exam_layout.dart';
import 'package:test1/screen/islam/islam_screen.dart';

class HomeController extends GetxController {
  void openArabic() {
    Get.to(() => const ArScreen());
  }

  void openEnglish() {
    Get.to(() => const EnScreen());
  }

  void openAnimals() {
    Ads().showAd();
    Get.to(() => const AnimalScreen());
  }

  void openColors() {
    Get.to(() => const ColorsScreen());
  }

  void openIslam() {
    Get.to(() => const IslamScreen());
  }

  void openExams() {
    Ads().showAd();
    Get.to(() => const ExamLayout());
  }
}