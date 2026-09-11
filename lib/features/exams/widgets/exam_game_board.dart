import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import 'exam_apple_items.dart';
import 'exam_number_targets.dart';


class ExamGameBoard extends StatelessWidget {
  const ExamGameBoard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          child: ExamAppleItems(),
        ),
        Container(
          width: 2,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 20),
          color: AppColors.arabicNumbers.withOpacity(.15),
        ),
        const Expanded(
          child: ExamNumberTargets(),
        ),
      ],
    );
  }
}