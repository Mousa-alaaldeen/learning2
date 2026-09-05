import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/game_progress_badge.dart';
import '../../../core/widgets/common/game_round_button.dart';
import '../../../core/widgets/common/game_title.dart';
import '../../../core/widgets/common/game_top_bar.dart';
import '../../../core/widgets/letters/letter_adventure.dart';
import '../../../core/widgets/letters/letter_info.dart';
import '../../../core/widgets/letters/letter_navigation.dart';
import '../controllers/letter_controller.dart';

class LettersScreen extends GetView<LetterController> {
  const LettersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(
          () {
            final letter = controller.currentLetter;

            return Column(
              children: [
                GameTopBar(
                  onHome: () => Get.back(),
                  onSpeak: controller.speakCurrentLetter,
                  center: Obx(
                    () => GameProgressBadge(
                      current: controller.currentIndex.value + 1,
                      total: controller.letters.length,
                      color: AppColors.lettersBlue,
                    ),
                  ),
                ),
                GameTitle(
                  title: 'مغامرة الحروف',
                  subtitle: 'هيا نتعلم حرفًا جديدًا! 📚',
                  titleColor: AppColors.lettersTitle,
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      8,
                      16,
                      12,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                            child: LetterAdventure(
                          letter: letter,
                          color: AppColors.lettersBlue,
                        )),
                        const SizedBox(height: 14),
                        LetterInfo(
                          letter: letter,
                          color: AppColors.lettersBlue,
                          onSpeak: controller.speakCurrentLetter,
                        ),
                        const SizedBox(height: 14),
                        LetterNavigation(
                          isFirst: controller.isFirst,
                          isLast: controller.isLast,
                          progress: controller.progress,
                          onPrevious: controller.previousLetter,
                          onNext: controller.nextLetter,
                        )
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
