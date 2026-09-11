import 'dart:math';

import 'package:get/get.dart';

import '../../../data/local/learning_data.dart';

class EnglishNumbersExamController extends GetxController {
  final Random _random = Random();

  final items = <Map<String, dynamic>>[].obs;
  final targets = <Map<String, dynamic>>[].obs;

  final score = 0.obs;
  final isGameOver = false.obs;

  @override
  void onInit() {
    super.onInit();
    startGame();
  }

  void startGame() {
    items.assignAll(LearningData.englishNumbersExam);
    targets.assignAll(LearningData.englishNumbersExam);

    items.shuffle(_random);
    targets.shuffle(_random);

    score.value = 0;
    isGameOver.value = false;
  }

  void checkAnswer(
    Map<String, dynamic> item,
    Map<String, dynamic> target,
  ) {
    if (item['count'] == target['count']) {
      items.remove(item);
      targets.remove(target);

      score.value += 10;

      if (items.isEmpty) {
        isGameOver.value = true;
      }
    } else {
      score.value -= 5;
    }
  }
}
