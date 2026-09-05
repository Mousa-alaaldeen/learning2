import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/senses_controller.dart';

class SensePortal extends StatelessWidget {
  const SensePortal({
    super.key,
    required this.sense,
    required this.selected,
    required this.onTap,
  });

  final SenseItem sense;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: selected ? 1.12 : 1,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOutBack,
        child: Column(
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: selected ? 82 : 70,
              height: selected ? 82 : 70,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: sense.color,
                border: Border.all(
                  color: AppColors.white,
                  width: 4,
                ),
                boxShadow: [
                  BoxShadow(
                    color: sense.color.withOpacity(.55),
                    blurRadius: selected ? 22 : 12,
                    spreadRadius: selected ? 5 : 1,
                  ),
                ],
              ),
              child: Icon(
                sense.icon,
                size: selected ? 45 : 38,
                color: AppColors.white,
              ),
            ),

            const SizedBox(height: 4),

            Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 3,
              ),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                sense.name,
                style: const TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: AppColors.sensesLabelText,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}