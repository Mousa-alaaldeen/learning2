import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:get/get.dart';

import '../../../core/services/tts_service.dart';
import '../../../data/local/learning_data.dart';
import '../../../data/models/number_model.dart';

class EnglishWritingNumbersController extends GetxController {
  final TtsService _ttsService = TtsService();

  late final DrawingController drawingController;

  final currentIndex = 0.obs;

  final List<NumberModel> numbers = LearningData.englishNumbers;

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

    drawingController = DrawingController();

    _ttsService.init(language: 'en-US');
  }

  void nextNumber() {
    if (isLast) return;

    currentIndex.value++;
    clearDrawing();
  }

  void previousNumber() {
    if (isFirst) return;

    currentIndex.value--;
    clearDrawing();
  }

  void clearDrawing() {
    drawingController.clear();
  }

  Future<void> speakNumber() async {
    await _ttsService.speak(
      currentNumber.number,
      language: 'en-US',
    );
  }

  Future<void> speakCurrentNumber() async {
    await _ttsService.speak(
      '${currentNumber.number}, ${currentNumber.name}',
      language: 'en-US',
    );
  }

  @override
  void onClose() {
    drawingController.dispose();
    _ttsService.dispose();

    super.onClose();
  }
}