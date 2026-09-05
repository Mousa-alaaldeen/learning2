import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../core/theme/icon_broken.dart';
import '../controllers/arabic_controller.dart';
import '../../../core/widgets/common/learning_category_card.dart';

class ArabicScreen extends GetView<ArabicController> {
  const ArabicScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.lettersTitle,
        title: const Text(
          'تعلم اللغة العربية',
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 26,
            fontWeight: FontWeight.w900,
            color: AppColors.lettersTitle,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            IconBroken.arrowRight,
            color: AppColors.lettersTitle,
          ),
          onPressed: Get.back,
        ),
      ),
      body: GridView(
        padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 14,
          mainAxisSpacing: 14,
          childAspectRatio: .84,
        ),
        children: [
          LearningCategoryCard(
            title: 'الأرقام العربية',
            subtitle: 'واحد، اثنان، ثلاثة...',
            icon: Icons.pin_rounded,
            color: AppColors.arabicNumbers,
            onTap: controller.openNumbers,
          ),
          LearningCategoryCard(
            title: 'الحروف العربية',
            subtitle: 'أ، ب، ت، ث...',
            icon: Icons.translate_rounded,
            color: AppColors.arabicLetters,
            onTap: controller.openLetters,
          ),
          LearningCategoryCard(
            title: 'كتابة الحروف',
            subtitle: 'تدرب واكتب بنفسك',
            icon: Icons.edit_rounded,
            color: AppColors.arabicWriting,
            onTap: controller.openWriting,
          ),
          LearningCategoryCard(
            title: 'الحواس الخمس',
            subtitle: 'البصر، السمع، الشم...',
            icon: Icons.visibility_rounded,
            color: AppColors.arabicSenses,
            onTap: controller.openSenses,
          ),
        ],
      ),
    );
  }
}
