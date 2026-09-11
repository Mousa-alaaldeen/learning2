import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/icon_broken.dart';
import '../../../core/widgets/common/game_round_button.dart';
import '../../../core/widgets/common/game_title.dart';
import '../controllers/english_numbers_exam_controller.dart';
import '../widgets/exam_game_board.dart';
import '../widgets/exam_game_over.dart';
import '../widgets/exam_score_badge.dart';

class EnglishNumbersExamScreen extends GetView<EnglishNumbersExamController> {
  const EnglishNumbersExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: GameRoundButton(
                  icon: IconBroken.arrowRight,
                  onTap: () => Get.back(),
                ),
              ),
            ),
            const GameTitle(
              title: 'English Numbers Exam 🍎',
              subtitle: 'Match the apples with the correct number',
              titleColor: AppColors.englishNumbers,
            ),
            const SizedBox(height: 12),
            Obx(
              () => ExamScoreBadge(
                score: controller.score.value,
                color: AppColors.englishNumbers,
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: Obx(
                () => controller.isGameOver.value
                    ? ExamGameOver(
                        score: controller.score.value,
                        onRetry: controller.startGame,
                      )
                    : ExamGameBoard(
                        items: controller.items.toList(),
                        targets: controller.targets.toList(),
                        color: AppColors.englishNumbers,
                        onAccept: controller.checkAnswer,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
