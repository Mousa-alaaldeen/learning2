import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/icon_broken.dart';
import '../../../core/widgets/common/game_round_button.dart';
import '../../../core/widgets/common/game_title.dart';
import '../controllers/arabic_numbers_exam_controller.dart';

class ArabicNumbersExamScreen extends GetView<ArabicNumbersExamController> {
  const ArabicNumbersExamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 12,
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: GameRoundButton(
                  icon: IconBroken.arrowRight,
                  onTap: () => Get.back(),
                ),
              ),
            ),
            const GameTitle(
              title: 'اختبار الأرقام العربية 🍎',
              subtitle: 'طابق عدد التفاحات مع الرقم الصحيح',
              titleColor: AppColors.arabicNumbers,
            ),
            const SizedBox(height: 12),
            Obx(
              () => Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: 18,
                  vertical: 8,
                ),
                decoration: BoxDecoration(
                  color: AppColors.arabicNumbers.withOpacity(.12),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  'النقاط: ${controller.score.value}',
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 20,
                    fontWeight: FontWeight.w900,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 18),
            Expanded(
              child: Obx(
                () => controller.isGameOver.value
                    ? _buildGameOver()
                    : _buildGame(context),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildGame(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _buildAppleItems(),
        ),
        Container(
          width: 2,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          color: AppColors.arabicNumbers.withOpacity(.15),
        ),
        Expanded(
          child: _buildTargets(),
        ),
      ],
    );
  }

  Widget _buildAppleItems() {
    return Obx(
      () => ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: controller.items.length,
        itemBuilder: (context, index) {
          final item = controller.items[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: Draggable<Map<String, dynamic>>(
              data: item,
              feedback: Material(
                color: Colors.transparent,
                child: _appleCard(item, dragging: true),
              ),
              childWhenDragging: Opacity(
                opacity: .25,
                child: _appleCard(item),
              ),
              child: _appleCard(item),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTargets() {
    return Obx(
      () => ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: controller.targets.length,
        itemBuilder: (context, index) {
          final target = controller.targets[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: DragTarget<Map<String, dynamic>>(
              onWillAcceptWithDetails: (details) => true,
              onAcceptWithDetails: (details) {
                controller.checkAnswer(
                  details.data,
                  target,
                );
              },
              builder: (context, candidateData, rejectedData) {
                final isHovering = candidateData.isNotEmpty;

                return AnimatedContainer(
                  duration: const Duration(milliseconds: 180),
                  height: 90,
                  decoration: BoxDecoration(
                    color: isHovering
                        ? AppColors.arabicNumbers.withOpacity(.18)
                        : Colors.white,
                    borderRadius: BorderRadius.circular(22),
                    border: Border.all(
                      color: AppColors.arabicNumbers.withOpacity(
                        isHovering ? .8 : .2,
                      ),
                      width: isHovering ? 3 : 1.5,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.06),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Center(
                    child: Text(
                      target['number'],
                      style: const TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 38,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  Widget _appleCard(
    Map<String, dynamic> item, {
    bool dragging = false,
  }) {
    final count = item['count'] as int;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      constraints: const BoxConstraints(
        minHeight: 90,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.arabicNumbers.withOpacity(.25),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              dragging ? .15 : .06,
            ),
            blurRadius: dragging ? 16 : 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 2,
            runSpacing: 2,
            children: List.generate(
              count,
              (_) => const Text(
                '🍎',
                style: TextStyle(fontSize: 25),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            item['number'],
            style: const TextStyle(
              fontFamily: 'Amiri',
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildGameOver() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            '🎉',
            style: TextStyle(fontSize: 70),
          ),
          const SizedBox(height: 10),
          const Text(
            'أحسنت!',
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 34,
              fontWeight: FontWeight.w900,
            ),
          ),
          const SizedBox(height: 8),
          Obx(
            () => Text(
              'نتيجتك: ${controller.score.value}',
              style: const TextStyle(
                fontFamily: 'Amiri',
                fontSize: 24,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(height: 24),
          GameRoundButton(
            icon: Icons.refresh_rounded,
            onTap: controller.startGame,
          ),
        ],
      ),
    );
  }
}
