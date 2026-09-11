import 'package:flutter/material.dart';

class ExamScoreBadge extends StatelessWidget {
  final int score;
  final Color color;

  const ExamScoreBadge({
    super.key,
    required this.score,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 18,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: color.withOpacity(.12),
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