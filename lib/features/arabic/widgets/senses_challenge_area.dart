import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/senses_controller.dart';
import 'senses_answer_grid.dart';
import 'senses_mini_icon.dart';

class SensesChallengeArea extends StatelessWidget {
  const SensesChallengeArea({
    super.key,
    required this.sense,
    required this.currentIndex,
    required this.question,
    required this.answerGrid,
  });

  final SenseItem sense;
  final int currentIndex;
  final String question;
  final SensesAnswerGrid answerGrid;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              SensesMiniIcon(
                icon: sense.icon,
                color: sense.color,
              ),

              const SizedBox(width: 10),

              Expanded(
                child: Text(
                  sense.name,
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lettersText,
                  ),
                ),
              ),

              Text(
                '${currentIndex + 1}/5',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.lettersHint,
                ),
              ),
            ],
          ),

          const SizedBox(height: 14),

          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 13,
            ),
            decoration: BoxDecoration(
              color: sense.color.withOpacity(.18),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              question,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Amiri',
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppColors.lettersText,
              ),
            ),
          ),

          const SizedBox(height: 15),

          answerGrid,
        ],
      ),
    )
        .animate(
          key: ValueKey(currentIndex),
        )
        .fadeIn(
          duration: 400.ms,
        )
        .slideY(
          begin: .15,
          end: 0,
          duration: 450.ms,
          curve: Curves.easeOutBack,
        );
  }
}