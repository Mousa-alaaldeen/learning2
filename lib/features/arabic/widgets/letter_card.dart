import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../../../data/models/letter_model.dart';

class LetterCard extends StatelessWidget {
  final LetterModel letter;

  const LetterCard({
    super.key,
    required this.letter,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.surface,
        borderRadius: BorderRadius.circular(32),
        border: Border.all(
          color: AppColors.cardBorder,
        ),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 110,
            height: 110,
            decoration: BoxDecoration(
              color: AppColors.arabic,
              shape: BoxShape.circle,
            ),
            child: Icon(
              letter.icon,
              size: 58,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 18),

          Text(
            letter.letter,
            style: const TextStyle(
              fontFamily: 'Amiri',
              fontSize: 90,
              height: 1,
              fontWeight: FontWeight.bold,
              color: AppColors.primary,
            ),
          ),

          const SizedBox(height: 12),

          Text(
            letter.word,
            style: const TextStyle(
              fontFamily: 'Amiri',
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: AppColors.textPrimary,
            ),
          ),

          const SizedBox(height: 6),

          Text(
            'حرف ${letter.letter}',
            style: const TextStyle(
              fontSize: 15,
              color: AppColors.textSecondary,
            ),
          ),
        ],
      ),
    );
  }
}