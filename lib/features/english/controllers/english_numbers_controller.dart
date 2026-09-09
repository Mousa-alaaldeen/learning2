import 'package:get/get.dart';

import '../../../core/services/tts_service.dart';
import '../../../data/local/learning_data.dart';
import '../../../data/models/number_model.dart';

class EnglishNumbersController extends GetxController {
  final TtsService _ttsService = TtsService();

  final List<NumberModel> numbers = LearningData.englishNumbers;

  final currentIndex = 0.obs;
  final visibleObjects = 0.obs;
  final isCounting = false.obs;
  final totalStars = 0.obs;

  NumberModel get currentNumber => numbers[currentIndex.value];

  bool get isFirst => currentIndex.value == 0;

  bool get isLast => currentIndex.value == numbers.length - 1;

  double get progress {
    if (numbers.isEmpty) return 0;

    return (currentIndex.value + 1) / numbers.length;
  }

  @override
  void onInit() {
    super.onInit();
    _ttsService.init(language: 'en-US');
    playCounting();
  }

  Future<void> speakNumber() async {
    await _ttsService.speak(
      currentNumber.name,
      language: 'en-US',
    );
  }

  Future<void> playCounting() async {
    if (isCounting.value) return;

    isCounting.value = true;
    visibleObjects.value = 0;

    await Future.delayed(const Duration(milliseconds: 300));

    final count = currentNumber.value;

    for (int i = 1; i <= count; i++) {
      if (isClosed) return;

      visibleObjects.value = i;

      await _ttsService.speak(
        _numberName(i),
        language: 'en-US',
      );

      await Future.delayed(const Duration(milliseconds: 300));
    }

    isCounting.value = false;
  }

  String _numberName(int number) {
    switch (number) {
      case 1:
        return 'One';
      case 2:
        return 'Two';
      case 3:
        return 'Three';
      case 4:
        return 'Four';
      case 5:
        return 'Five';
      case 6:
        return 'Six';
      case 7:
        return 'Seven';
      case 8:
        return 'Eight';
      case 9:
        return 'Nine';
      case 10:
        return 'Ten';
      default:
        return '';
    }
  }

  void nextNumber() {
    if (isLast) return;

    _ttsService.stop();
    isCounting.value = false;
    currentIndex.value++;
    playCounting();
  }

  void previousNumber() {
    if (isFirst) return;

    _ttsService.stop();
    isCounting.value = false;
    currentIndex.value--;
    playCounting();
  }

  @override
  void onClose() {
    _ttsService.dispose();
    super.onClose();
  }
}