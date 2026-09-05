import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/game_progress_badge.dart';
import '../../../core/widgets/common/game_title.dart';
import '../../../core/widgets/common/game_top_bar.dart';
import '../controllers/writing_controller.dart';
import '../widgets/drawing/drawing_board_widget.dart';
import '../widgets/drawing/drawing_controls.dart';

class WritingScreen extends GetView<WritingController> {
  const WritingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          child: Column(
            children: [
              GameTopBar(
                onHome: () => Get.back(),
                onSpeak: controller.speakCurrentLetter,
                center: Obx(
                  () => GameProgressBadge(
                    current: controller.currentIndex.value + 1,
                    total: controller.letters.length,
                    color: AppColors.lettersBlue,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              GameTitle(
                title: 'هيا نكتب!',
                subtitle: 'اتبع الحرف واكتب مثله ✏️🌟',
                titleColor: AppColors.lettersTitle,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(
                  () {
                    controller.currentIndex.value;

                    return DrawingBoardWidget(
                      controller: controller,
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => DrawingControls(
                  controller: controller,
                  letter: controller.currentLetter.letter,
                ),
              ),
              const SizedBox(height: 12),
              Material(
                color: AppColors.numbersBlue,
                borderRadius: BorderRadius.circular(16),
                child: InkWell(
                  onTap: controller.clearDrawing,
                  borderRadius: BorderRadius.circular(16),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Icon(
                          Icons.refresh_rounded,
                          size: 20,
                          color: AppColors.white,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'مسح الكتابة',
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
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
