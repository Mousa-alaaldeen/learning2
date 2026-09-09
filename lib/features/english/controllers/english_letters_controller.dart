import 'package:get/get.dart';

import '../../../core/services/tts_service.dart';
import '../../../data/local/learning_data.dart';
import '../../../data/models/letter_model.dart';

class EnglishLettersController extends GetxController {
  final TtsService _ttsService = TtsService();

  final List<LetterModel> letters = LearningData.englishLetters;

  final currentIndex = 0.obs;

  LetterModel get currentLetter {
    return letters[currentIndex.value];
  }

  bool get isFirst {
    return currentIndex.value == 0;
  }

  bool get isLast {
    return currentIndex.value == letters.length - 1;
  }

  double get progress {
    if (letters.isEmpty) return 0;

    return (currentIndex.value + 1) / letters.length;
  }

  @override
  void onInit() {
    super.onInit();

    _ttsService.init(language: 'en-US');
  }

  Future<void> speakCurrentLetter() async {
    await _ttsService.speak(
      '${currentLetter.letter}, ${currentLetter.word}',
      language: 'en-US',
    );
  }

  void nextLetter() {
    if (isLast) return;

    currentIndex.value++;
    speakCurrentLetter();
  }

  void previousLetter() {
    if (isFirst) return;

    currentIndex.value--;
    speakCurrentLetter();
  }

  @override
  void onClose() {
    _ttsService.dispose();
    super.onClose();
  }
}