import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/arabic_numbers_exam_controller.dart';
import 'exam_number_target.dart';

class ExamNumberTargets extends GetView<ArabicNumbersExamController> {
  const ExamNumberTargets({super.key});

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: controller.targets.length,
        itemBuilder: (context, index) {
          final target = controller.targets[index];

          return Padding(
            padding: const EdgeInsets.only(bottom: 12),
            child: DragTarget<Map<String, dynamic>>(
              onWillAcceptWithDetails: (_) => true,
              onAcceptWithDetails: (details) {
                controller.checkAnswer(
                  details.data,
                  target,
                );
              },
              builder: (
                context,
                candidateData,
                rejectedData,
              ) {
                return ExamNumberTarget(
                  number: target['number'],
                  isHovering: candidateData.isNotEmpty,
                );
              },
            ),
          );
        },
      ),
    );
  }
}