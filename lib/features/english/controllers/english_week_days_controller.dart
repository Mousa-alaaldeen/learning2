import 'package:get/get.dart';

import '../../../core/services/tts_service.dart';
import '../../../data/local/learning_data.dart';
import '../../../data/models/week_day_model.dart';

class EnglishWeekDaysController extends GetxController {
  final TtsService _ttsService = TtsService();

  final currentIndex = 0.obs;

  final List<WeekDayModel> days = LearningData.englishWeekDays;

  WeekDayModel get currentDay => days[currentIndex.value];

  bool get isFirst => currentIndex.value == 0;

  bool get isLast => currentIndex.value == days.length - 1;

  double get progress {
    if (days.isEmpty) return 0;

    return (currentIndex.value + 1) / days.length;
  }

  @override
  void onInit() {
    super.onInit();

    _ttsService.init(language: 'en-US');
  }

  Future<void> speakCurrentDay() async {
    await _ttsService.speak(
      currentDay.name,
      language: 'en-US',
    );
  }

  void nextDay() {
    if (isLast) return;

    currentIndex.value++;
    speakCurrentDay();
  }

  void previousDay() {
    if (isFirst) return;

    currentIndex.value--;
    speakCurrentDay();
  }

  @override
  void onClose() {
    _ttsService.dispose();
    super.onClose();
  }
}