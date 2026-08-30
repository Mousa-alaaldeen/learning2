import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/writing_controller.dart';
import '../widgets/drawing/drawing_board_widget.dart';
import '../widgets/drawing/drawing_controls.dart';

class WritingScreen extends GetView<DrawingPageController> {
  const WritingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.background,
        foregroundColor: AppColors.textPrimary,
        centerTitle: true,
        title: const Text(
          'كتابة الحروف العربية',
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 23,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          child: Column(
            children: [
              Obx(
                () => Column(
                  children: [
                    Row(
                      children: [
                        const Text(
                          'تدريب الكتابة',
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimary,
                          ),
                        ),
                        const Spacer(),
                        Text(
                          '${controller.currentIndex.value + 1} / ${controller.letters.length}',
                          style: const TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 16,
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 8),

                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: controller.progress,
                        minHeight: 7,
                        backgroundColor: AppColors.surface,
                        valueColor:
                            const AlwaysStoppedAnimation<Color>(
                          AppColors.primary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 16),

              Expanded(
                child: Obx(
                  () => DrawingBoardWidget(
                    controller: controller,
                  ),
                ),
              ),

              const SizedBox(height: 16),

              Obx(
                () => DrawingControls(
                  controller: controller,
                ),
              ),

              const SizedBox(height: 12),

              Material(
                color: AppColors.surface,
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
                          color: AppColors.textSecondary,
                        ),
                        SizedBox(width: 7),
                        Text(
                          'مسح الكتابة',
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 16,
                            color: AppColors.textSecondary,
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