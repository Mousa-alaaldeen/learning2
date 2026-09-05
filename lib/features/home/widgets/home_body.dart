import 'package:flutter/material.dart';

import 'package:test1/features/home/widgets/home_header.dart';
import 'package:test1/core/widgets/common/learning_category_card.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/home_controller.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({
    super.key,
    required this.controller,
  });

  final HomeController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.background,
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(
            child: HomeHeader(),
          ),
          SliverPadding(
            padding: const EdgeInsets.fromLTRB(
              16,
              8,
              16,
              32,
            ),
            sliver: SliverGrid(
              delegate: SliverChildListDelegate(
                [
                  LearningCategoryCard(
                    title: 'اللغة العربية',
                    subtitle: 'الحروف والأرقام',
                    icon: Icons.menu_book_rounded,
                    color: AppColors.arabicWriting,
                    onTap: controller.openArabic,
                  ),
                  LearningCategoryCard(
                    title: 'اللغة الإنجليزية',
                    subtitle: 'Learn English',
                    icon: Icons.language_rounded,
                    color: AppColors.lettersPrimary,
                    onTap: controller.openEnglish,
                  ),
                  LearningCategoryCard(
                    title: 'أصوات الحيوانات',
                    subtitle: 'تعرف على الحيوانات',
                    icon: Icons.pets_rounded,
                    color: AppColors.lettersBlue,
                    onTap: controller.openAnimals,
                  ),
                  LearningCategoryCard(
                    title: 'تعلم الألوان',
                    subtitle: 'اكتشف الألوان',
                    icon: Icons.palette_rounded,
                    color: AppColors.numbersGreen,
                    onTap: controller.openColors,
                  ),
                  LearningCategoryCard(
                    title: 'التربية الإسلامية',
                    subtitle: 'تعلم دينك',
                    icon: Icons.mosque_rounded,
                    color: AppColors.numbersDecorationPurple,
                    onTap: controller.openIslam,
                  ),
                  LearningCategoryCard(
                    title: 'الاختبارات',
                    subtitle: 'اختبر معلوماتك',
                    icon: Icons.quiz_rounded,
                    color: AppColors.numbersRed,
                    onTap: controller.openExams,
                  ),
                ],
              ),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 0.88,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
