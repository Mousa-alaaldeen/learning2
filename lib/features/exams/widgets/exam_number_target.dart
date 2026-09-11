import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ExamNumberTarget extends StatelessWidget {
  final String number;
  final bool isHovering;

  const ExamNumberTarget({
    super.key,
    required this.number,
    required this.isHovering,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      height: 90,
      decoration: BoxDecoration(
        color: isHovering
            ? AppColors.arabicNumbers.withOpacity(.18)
            : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.arabicNumbers.withOpacity(
            isHovering ? .8 : .2,
          ),
          width: isHovering ? 3 : 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontFamily: 'Amiri',
            fontSize: 38,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}