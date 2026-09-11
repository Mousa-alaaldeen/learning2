import 'package:flutter/material.dart';

import '../../../core/widgets/common/game_round_button.dart';

class ExamGameOver extends StatelessWidget {
  final int score;
  final VoidCallback onRetry;

  const ExamGameOver({
    super.key,
    required this.score,
    required this.onRetry,
  });

  @override
  Widget build(BuildContext context) {
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
          Text(
            'نتيجتك: $score',
            style: const TextStyle(
              fontFamily: 'Amiri',
              fontSize: 24,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 24),
          GameRoundButton(
            icon: Icons.refresh_rounded,
            onTap: onRetry,
          ),
        ],
      ),
    );
  }
}