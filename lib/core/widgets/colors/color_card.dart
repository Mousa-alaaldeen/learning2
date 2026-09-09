import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../theme/app_colors.dart';

class ColorCard extends StatelessWidget {
  const ColorCard({
    super.key,
    required this.color,
    required this.name,
    required this.emoji,
    required this.onTap,
    required this.isSelected,
  });

  final Color color;
  final String name;
  final String emoji;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedScale(
        scale: isSelected ? 1.08 : 1,
        duration: const Duration(milliseconds: 200),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: AppColors.white,
            borderRadius: BorderRadius.circular(24),
            border: Border.all(
              color: isSelected ? color : Colors.transparent,
              width: 3,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: isSelected ? 16 : 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 250),
                width: isSelected ? 78 : 68,
                height: isSelected ? 78 : 68,
                decoration: BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                  border: color == const Color(0xFFF5F5F5)
                      ? Border.all(
                          color: Colors.black12,
                          width: 2,
                        )
                      : null,
                ),
                child: Center(
                  child: Text(
                    emoji,
                    style: const TextStyle(
                      fontSize: 36,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 9),
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: AppColors.numbersText,
                ),
              ),
            ],
          ),
        ),
      ),
    )
        .animate(
          key: ValueKey(name),
        )
        .fadeIn(duration: 350.ms)
        .scale(
          begin: const Offset(.8, .8),
          end: const Offset(1, 1),
          duration: 400.ms,
          curve: Curves.easeOutBack,
        );
  }
}