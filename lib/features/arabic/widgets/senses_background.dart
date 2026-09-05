import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SensesBackground extends StatelessWidget {
  const SensesBackground({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: IgnorePointer(
        child: Stack(
          children: [
            Positioned(
              top: -60,
              right: -40,
              child: Container(
                width: 180,
                height: 180,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.sensesBackgroundCircleBlue
                      .withOpacity(.45),
                ),
              ),
            ),

            Positioned(
              bottom: -70,
              left: -50,
              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: AppColors.sensesBackgroundCirclePurple
                      .withOpacity(.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}