import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/icon_broken.dart';
import '../../../core/widgets/common/game_round_button.dart';
import '../../../core/widgets/common/game_title.dart';
import '../../../core/widgets/common/learning_category_card.dart';
import '../controllers/exams_controller.dart';

class ExamsScreen extends GetView<ExamsController> {
  const ExamsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: Alignment.centerRight,
                child: GameRoundButton(
                  icon: IconBroken.arrowRight,
                  onTap: () => Get.back(),
                ),
              ),
            ),
            const SizedBox(height: 8),
            const GameTitle(
              title: 'الاختبارات 📝',
              subtitle: 'اختبر معلوماتك وتعلّم بطريقة ممتعة',
              titleColor: AppColors.lettersTitle,
            ),
            const SizedBox(height: 20),
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 8,
                ),
                crossAxisCount: 2,
                crossAxisSpacing: 14,
                mainAxisSpacing: 14,
                childAspectRatio: .92,
                physics: const BouncingScrollPhysics(),
                children: [
                  LearningCategoryCard(
                    title: 'الأرقام العربية',
                    subtitle: 'اختبر معرفتك بالأرقام',
                    icon: Icons.pin_rounded,
                    color: AppColors.arabicNumbers,
                    onTap: controller.openArabicNumbers,
                  ),
                  LearningCategoryCard(
                    title: 'الأرقام الإنجليزية',
                    subtitle: 'اختبر معرفتك بالأرقام',
                    icon: Icons.numbers_rounded,
                    color: AppColors.englishNumbers,
                    onTap: controller.openEnglishNumbers,
                  ),
                  LearningCategoryCard(
                    title: 'الحروف العربية',
                    subtitle: 'اختبر معرفتك بالحروف',
                    icon: Icons.text_fields_rounded,
                    color: AppColors.arabicLetters,
                    onTap: controller.openArabicLetters,
                  ),
                  LearningCategoryCard(
                    title: 'الحروف الإنجليزية',
                    subtitle: 'اختبر معرفتك بالحروف',
                    icon: Icons.abc_rounded,
                    color: AppColors.englishLetters,
                    onTap: controller.openEnglishLetters,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}