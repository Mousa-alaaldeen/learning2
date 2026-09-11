import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/game_title.dart';
import '../../../core/widgets/common/game_top_bar.dart';
import '../../../data/local/learning_data.dart';
import '../controllers/pillars_of_faith_controller.dart';
import '../widgets/pillar_card.dart';

class PillarsOfFaithScreen extends GetView<PillarsOfFaithController> {
  const PillarsOfFaithScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            GameTopBar(
              onHome: () => Get.back(),
              onSpeak: () {
                controller.speakPillar(
                  LearningData.pillarsOfFaith.first,
                  0,
                );
              },
              center: Text(
                '${ LearningData.pillarsOfFaith.length} أركان',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: AppColors.lettersTitle,
                ),
              ),
            ),
            const GameTitle(
              title: 'أركان الإيمان',
              subtitle: 'هيا نتعلم أركان الإيمان الستة معًا! 🌟',
              titleColor: AppColors.lettersTitle,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: Obx(
                  () => Column(
                    children: List.generate(
                       LearningData.pillarsOfFaith.length,
                      (index) {
                        final pillar =  LearningData.pillarsOfFaith[index];

                        return PillarCard(
                          pillar: pillar,
                          index: index,
                          isSpeaking:
                              controller.speakingIndex.value == index,
                          onSpeak: () {
                            controller.speakPillar(
                              pillar,
                              index,
                            );
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

