import 'package:get/get.dart';

import '../../../app/routes/app_routes.dart';
import '../../../component/ads/interstitial_ad.dart';

class EnglishController extends GetxController {
  void openLetters() {
    Get.toNamed(AppRoutes.englishLetters);
  }

  void openWritingLetters() {
    Get.toNamed(AppRoutes.englishWritingLetters);
  }

  void openNumbers() {
    Get.toNamed(AppRoutes.englishNumbers);
  }

  void openWritingNumbers() {
    Get.toNamed(AppRoutes.englishWritingNumbers);
  }

  void openSenses() {
    Ads().showAd();
    Get.toNamed(AppRoutes.englishSenses);
  }

  void openStories() {
    Ads().showAd();
    Get.toNamed(AppRoutes.englishStories);
  }

  void openWeekDays() {
    Get.toNamed(AppRoutes.englishWeekDays);
  }
  void openColors() {
  Get.toNamed(AppRoutes.englishColors);
}
}