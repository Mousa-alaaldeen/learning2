import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/game_title.dart';
import '../../../core/widgets/common/game_top_bar.dart';
import '../../../core/widgets/numbers/counting_card.dart';
import '../../../core/widgets/numbers/number_adventure.dart';
import '../../../core/widgets/numbers/number_navigation.dart';
import '../controllers/english_numbers_controller.dart';

class EnglishNumbersScreen extends GetView<EnglishNumbersController> {
  const EnglishNumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              GameTopBar(
                onHome: () => Get.back(),
                onSpeak: controller.speakNumber,
                center: Text(
                  '${controller.currentIndex.value + 1} / ${controller.numbers.length}',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w900,
                    color: AppColors.numbersTitle,
                  ),
                ),
              ),
              GameTitle(
                title: 'Number Adventure',
                subtitle: 'Let’s learn numbers and count together! 🔢',
                titleColor: AppColors.numbersTitle,
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
                      NumberAdventure(
                        number: controller.currentNumber,
                        index: controller.currentIndex.value,
                        subtitle: 'Let’s count together! 🍎',
                      ),
                      const SizedBox(height: 18),
                      CountingCard(
                        visibleObjects: controller.visibleObjects.value,
                        currentIndex: controller.currentIndex.value,
                        totalNumbers: controller.numbers.length,
                        isCounting: controller.isCounting.value,
                        onCount: controller.playCounting,
                         english: true,
                        title: 'Let’s Count the Apples',
                        readyText: 'Get ready to count! 🍎',
                        buttonText: 'Count with me',
                        countingText: 'Counting...',
                      ),
                      const SizedBox(height: 18),
                      NumberNavigation(
                        isFirst: controller.isFirst,
                        isLast: controller.isLast,
                        onPrevious: controller.previousNumber,
                        onNext: controller.nextNumber,
                        onSpeak: controller.speakNumber,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}