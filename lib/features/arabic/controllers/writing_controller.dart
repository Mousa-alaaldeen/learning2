import 'package:flutter/material.dart';
import 'package:flutter_drawing_board/flutter_drawing_board.dart';
import 'package:get/get.dart';

import '../../../core/services/tts_service.dart';
import '../../../data/local/learning_data.dart';
import '../../../data/models/letter_model.dart';

class DrawingPageController extends GetxController {
  final TtsService _ttsService = TtsService();

  late final DrawingController drawingController;

  final currentIndex = 0.obs;

  final List<LetterModel> letters = LearningData.arabicLetters;

  LetterModel get currentLetter => letters[currentIndex.value];

  bool get isFirst => currentIndex.value == 0;

  bool get isLast => currentIndex.value == letters.length - 1;

  double get progress {
    if (letters.isEmpty) return 0;

    return (currentIndex.value + 1) / letters.length;
  }

  @override
  void onInit() {
    super.onInit();

    drawingController = DrawingController();

    _ttsService.init();
  }

  void nextLetter() {
    if (isLast) return;

    currentIndex.value++;
    clearDrawing();
  }

  void previousLetter() {
    if (isFirst) return;

    currentIndex.value--;
    clearDrawing();
  }

  void clearDrawing() {
    drawingController.clear();
  }

  Future<void> speakLetter() async {
    await _ttsService.speak(currentLetter.letter);
  }

  @override
  void onClose() {
    drawingController.dispose();
    _ttsService.dispose();

    super.onClose();
  }
}