import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/arabic_numbers_exam_controller.dart';
import 'exam_apple_card.dart';

class ExamAppleItems extends GetView<ArabicNumbersExamController> {
  const ExamAppleItems({super.key});

  @override
  Widget build(BuildContext context) {
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
                child: SizedBox(
                  width: 160,
                  child: ExamAppleCard(
                    item: item,
                    dragging: true,
                  ),
                ),
              ),
              childWhenDragging: Opacity(
                opacity: .25,
                child: ExamAppleCard(item: item),
              ),
              child: ExamAppleCard(item: item),
            ),
          );
        },
      ),
    );
  }
}