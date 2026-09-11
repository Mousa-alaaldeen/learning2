import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ExamScoreBadge extends StatelessWidget {
  final int score;

  const ExamScoreBadge({
    super.key,
    required this.score,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.arabicNumbers.withOpacity(.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        'النقاط: $score',
        style: const TextStyle(
          fontFamily: 'Amiri',
          fontSize: 20,
          fontWeight: FontWeight.w900,
        ),
      ),
    );
  }
}