import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:test1/data/local/learning_data.dart';
import 'package:test1/features/islam/widgets/video_card.dart';

import '../widgets/vedio_screen.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/game_title.dart';
import '../../../core/widgets/common/game_top_bar.dart';
import '../../../core/constants/app_images.dart';
import '../controllers/ablution_controller.dart';
import '../widgets/ablution_step_card.dart';

class AblutionScreen extends GetView<AblutionController> {
  const AblutionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            GameTopBar(
              onHome: () => Get.back(),
              onSpeak: controller.speakCurrent,
              center: const Text(
                'الوضوء',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: AppColors.lettersTitle,
                ),
              ),
            ),
            const GameTitle(
              title: 'تعلم الوضوء 💧',
              subtitle: 'هيا نتعلم خطوات الوضوء خطوة بخطوة!',
              titleColor: AppColors.lettersTitle,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(
                  16,
                  8,
                  16,
                  30,
                ),
                child: Obx(
                  () => Column(
                    children: [
                      ...List.generate(
                        LearningData.ablution.length,
                        (index) {
                          final step = LearningData.ablution[index];

                          return AblutionStepCard(
                            title: step['title']!,
                            description: step['description']!,
                            emoji: step['emoji']!,
                            index: index,
                            isSelected: controller.selectedIndex.value == index,
                            isSpeaking: controller.speakingIndex.value == index,
                            onTap: () {
                              controller.selectStep(index);
                            },
                            onSpeak: () {
                              controller.speakStep(index);
                            },
                          );
                        },
                      ),
                      const SizedBox(height: 6),
                      VideoCard(
                        onTap: () {
                          Get.to(
                            () => VedioScreen(
                              url: 'assets/video/Ablution.mp4',
                              text: AppImages.Ablution,
                            ),
                          );
                        },
                      ),
                    ],
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
