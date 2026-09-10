import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/game_progress_badge.dart';
import '../../../core/widgets/common/game_title.dart';
import '../../../core/widgets/common/game_top_bar.dart';
import '../controllers/english_senses_controller.dart';
import '../../arabic/widgets/senses_adventure_room.dart';
import '../../arabic/widgets/senses_answer_grid.dart';
import '../../arabic/widgets/senses_background.dart';
import '../../arabic/widgets/senses_challenge_area.dart';
import '../../arabic/widgets/senses_navigation.dart';

class EnglishSensesScreen extends GetView<EnglishSensesController> {
  const EnglishSensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              const SensesBackground(),
              Column(
                children: [
                  GameTopBar(
                    onHome: () => Get.back(),
                    onSpeak: controller.speakCurrent,
                    center: GameProgressBadge(
                      current: controller.currentIndex.value + 1,
                      total: controller.senses.length,
                      color: AppColors.sensesBlue,
                    ),
                  ),
                  const GameTitle(
                    title: 'Senses Adventure',
                    subtitle: 'Let’s discover the world around us!',
                    titleColor: AppColors.lettersTitle,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        8,
                        16,
                        24,
                      ),
                      child: Column(
                        children: [
                          SensesAdventureRoom(
                            senses: controller.senses,
                            currentIndex: controller.currentIndex.value,
                            onSelectSense: controller.selectSense,
                          ),
                          const SizedBox(height: 18),
                          SensesChallengeArea(
                            sense: controller.currentSense,
                            currentIndex: controller.currentIndex.value,
                            question: controller.questionForCurrent,
                            answerGrid: SensesAnswerGrid(
                              options: controller.optionsForCurrent,
                              currentIndex: controller.currentIndex.value,
                              highlightedOptionIndex:
                                  controller.highlightedOptionIndex,
                              isTeaching: controller.isTeaching,
                              onAnswer: (index) {
                                controller.checkAnswer(
                                  index,
                                  context,
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 18),
                          SensesNavigation(
                            isFirst: controller.isFirst,
                            isLast: controller.isLast,
                            onNext: controller.nextSense,
                            onPrevious: controller.previousSense,
                            onSpeak: controller.speakCurrent,
                          ),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}