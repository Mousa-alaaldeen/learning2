import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/icon_broken.dart';
import '../../../core/widgets/common/learning_category_card.dart';
import '../controllers/islam_controller.dart';

class IslamScreen extends GetView<IslamController> {
  const IslamScreen({super.key});

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
          'تعلم الاسلام 🕌',
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
            title: 'أركان الإسلام',
            subtitle: 'تعلم أركان الإسلام',
            icon: Icons.mosque_rounded,
            color: AppColors.arabicLetters,
            onTap: controller.openPillarsOfIslam,
          ),
          LearningCategoryCard(
            title: 'أركان الإيمان',
            subtitle: 'تعلم أركان الإيمان',
            icon: Icons.favorite_rounded,
            color: AppColors.arabicNumbers,
            onTap: controller.openPillarsOfFaith,
          ),
          LearningCategoryCard(
            title: 'تعلم الوضوء',
            subtitle: 'تعلم خطوات الوضوء',
            icon: Icons.water_drop_rounded,
            color: AppColors.sensesBlue,
            onTap: controller.openAblution,
          ),
          LearningCategoryCard(
            title: 'الأذان ودعاء الأذان',
            subtitle: 'تعلم الأذان والدعاء',
            icon: Icons.volume_up_rounded,
            color: AppColors.numbersGreen,
            onTap: controller.openAzan,
          ),
          LearningCategoryCard(
            title: 'التشهد والصلاة الإبراهيمية',
            subtitle: 'تعلم التشهد والصلاة',
            icon: Icons.menu_book_rounded,
            color: AppColors.numbersDecorationPurple,
            onTap: controller.openTashahhud,
          ),
        ],
      ),
    );
  }
}
