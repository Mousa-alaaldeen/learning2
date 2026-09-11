import 'dart:math';

import 'package:get/get.dart';

class ArabicNumbersExamController extends GetxController {
  final Random _random = Random();

  final numbers = <Map<String, dynamic>>[
    {'number': '١', 'count': 1},
    {'number': '٢', 'count': 2},
    {'number': '٣', 'count': 3},
    {'number': '٤', 'count': 4},
    {'number': '٥', 'count': 5},
    {'number': '٦', 'count': 6},
    {'number': '٧', 'count': 7},
    {'number': '٨', 'count': 8},
    {'number': '٩', 'count': 9},
    {'number': '١٠', 'count': 10},
  ];

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
    items.assignAll(numbers);
    targets.assignAll(numbers);
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