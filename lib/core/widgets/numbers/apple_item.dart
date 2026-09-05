
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../theme/app_colors.dart';

class AppleItem extends StatelessWidget {
  const AppleItem({
    super.key,
    required this.number,
  });

  final int number;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          width: 58,
          height: 58,
          decoration: BoxDecoration(
            color: AppColors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 8,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: const Icon(
            Icons.apple_rounded,
            size: 38,
            color: AppColors.numbersRed,
          ),
        ),

        const SizedBox(height: 2),

        Text(
          _arabicDigit(number),
          style: const TextStyle(
            fontFamily: 'Amiri',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColors.numbersText,
          ),
        ),
      ],
    )
        .animate()
        .fadeIn(duration: 350.ms)
        .scale(
          begin: const Offset(.3, .3),
          end: const Offset(1, 1),
          duration: 500.ms,
          curve: Curves.elasticOut,
        )
        .moveY(
          begin: 25,
          end: 0,
          duration: 450.ms,
          curve: Curves.easeOutBack,
        );
  }

  String _arabicDigit(int number) {
    const digits = [
      '٠',
      '١',
      '٢',
      '٣',
      '٤',
      '٥',
      '٦',
      '٧',
      '٨',
      '٩',
    ];

    if (number == 10) {
      return '١٠';
    }

    if (number < 0 || number > 9) {
      return number.toString();
    }

    return digits[number];
  }
}
