import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/icon_broken.dart';
import '../../../core/widgets/common/learning_category_card.dart';
import '../controllers/english_controller.dart';

class EnglishScreen extends GetView<EnglishController> {
  const EnglishScreen({super.key});

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
          'Learn English',
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
            title: 'English Numbers',
            subtitle: 'One, Two, Three...',
            icon: Icons.pin_rounded,
            color: AppColors.arabicNumbers,
            onTap: controller.openNumbers,
          ),
          LearningCategoryCard(
            title: 'English Letters',
            subtitle: 'A, B, C, D...',
            icon: Icons.translate_rounded,
            color: AppColors.arabicLetters,
            onTap: controller.openLetters,
          ),
          LearningCategoryCard(
            title: 'Writing Letters',
            subtitle: 'Practice writing letters',
            icon: Icons.edit_rounded,
            color: AppColors.arabicWriting,
            onTap: controller.openWritingLetters,
          ),
          LearningCategoryCard(
            title: 'Writing Numbers',
            subtitle: 'Practice writing numbers',
            icon: Icons.draw_rounded,
            color: AppColors.numbersGreen,
            onTap: controller.openWritingNumbers,
          ),
          LearningCategoryCard(
            title: 'The Senses',
            subtitle: 'Learn the five senses',
            icon: Icons.visibility_rounded,
            color: AppColors.sensesBlue,
            onTap: controller.openSenses,
          ),
          LearningCategoryCard(
            title: 'English Stories',
            subtitle: 'Learn and enjoy stories',
            icon: Icons.auto_stories_rounded,
            color: AppColors.numbersDecorationPurple,
            onTap: controller.openStories,
          ),
          LearningCategoryCard(
            title: 'Days of the Week',
            subtitle: 'Sunday, Monday, Tuesday...',
            icon: Icons.calendar_month_rounded,
            color: AppColors.arabicNumbers,
            onTap: controller.openWeekDays,
          ),
        ],
      ),
    );
  }
}