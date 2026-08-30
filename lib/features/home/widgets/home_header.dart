import 'package:flutter/material.dart';
import 'package:test1/features/home/widgets/decorative_circle.dart';

import '../../../core/theme/app_colors.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16, 20, 16, 14),
      child: Container(
        height: 150,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.20),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          children: [
// Decorative circles
            Positioned(
              top: -45,
              right: -25,
              child: DecorativeCircle(
                size: 120,
                color: AppColors.white.withOpacity(0.08),
              ),
            ),

            Positioned(
              bottom: -55,
              left: -35,
              child: DecorativeCircle(
                size: 130,
                color: AppColors.white.withOpacity(0.06),
              ),
            ),

            Positioned(
              top: 18,
              left: 110,
              child: Icon(
                Icons.auto_awesome_rounded,
                size: 20,
                color: AppColors.white.withOpacity(0.35),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(18),
              child: Row(
                children: [
                  Container(
                    width: 66,
                    height: 66,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.18),
                      borderRadius: BorderRadius.circular(22),
                    ),
                    child: const Icon(
                      Icons.school_rounded,
                      color: AppColors.white,
                      size: 34,
                    ),
                  ),
                  const SizedBox(width: 16),
                  const Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'مرحباً بك 👋',
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                        SizedBox(height: 4),
                        Text(
                          'ماذا تريد أن تتعلم اليوم؟',
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 16,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 38,
                    height: 38,
                    decoration: BoxDecoration(
                      color: AppColors.white.withOpacity(0.15),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.star_rounded,
                      color: AppColors.white,
                      size: 22,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
