import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/learning_category_card.dart';
import '../controllers/science_controller.dart';

class ScienceScreen extends GetView<ScienceController> {
  const ScienceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          onPressed: () => Get.back(),
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            color: AppColors.lettersTitle,
          ),
        ),
        title: const Text(
          'مغامرة العلوم 🔬',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.w900,
            color: AppColors.lettersTitle,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(
          16,
          12,
          16,
          24,
        ),
        child: Column(
          children: [
            const Text(
              'هيا نكتشف عالمنا من حولنا! 🌟',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w700,
                color: AppColors.lettersTitle,
              ),
            ),
            const SizedBox(height: 20),
            GridView.count(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              crossAxisCount: 2,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
              childAspectRatio: 0.88,
              children: [
                LearningCategoryCard(
                  title: 'أصوات الحيوانات',
                  subtitle: 'تعرف على أصوات الحيوانات',
                  icon: Icons.pets_rounded,
                  color: AppColors.lettersBlue,
                  onTap: controller.openAnimalSounds,
                ),
                LearningCategoryCard(
                  title: 'الحواس الخمس',
                  subtitle: 'البصر، السمع، الشم...',
                  icon: Icons.visibility_rounded,
                  color: AppColors.arabicSenses,
                  onTap: controller.openSenses,
                ),
                LearningCategoryCard(
                  title: 'النباتات',
                  subtitle: 'تعرف على عالم النباتات',
                  icon: Icons.local_florist_rounded,
                  color: AppColors.arabicWriting,
                  onTap: controller.openPlants,
                ),
                LearningCategoryCard(
                  title: 'الفضاء',
                  subtitle: 'اكتشف الكواكب والنجوم',
                  icon: Icons.rocket_launch_rounded,
                  color: AppColors.numbersDecorationPurple,
                  onTap: controller.openSpace,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
