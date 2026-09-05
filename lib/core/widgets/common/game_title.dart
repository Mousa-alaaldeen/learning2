
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class GameTitle extends StatelessWidget {
  const GameTitle({
    super.key,
    required this.title,
    required this.subtitle,
    required this.titleColor,
  });

  final String title;
  final String subtitle;
  final Color titleColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: titleColor,
          ),
        )
            .animate()
            .fadeIn(duration: 500.ms)
            .slideY(
              begin: -.3,
              end: 0,
            ),

        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontFamily: 'Amiri',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: Color(0xFF8A94AD),
          ),
        )
            .animate()
            .fadeIn(
              delay: 150.ms,
              duration: 400.ms,
            ),
      ],
    );
  }
}
