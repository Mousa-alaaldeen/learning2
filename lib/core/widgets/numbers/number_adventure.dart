import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../theme/app_colors.dart';

class NumberAdventure extends StatelessWidget {
  const NumberAdventure({
    super.key,
    required this.number,
    required this.index,
  });

  final dynamic number;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.numbersBackgroundTop,
            AppColors.numbersBackgroundBottom,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 18,
            top: 25,
            child: _Decoration(
              icon: Icons.star_rounded,
              color: AppColors.numbersDecorationAmber,
              size: 30,
            ),
          ),
          Positioned(
            right: 20,
            top: 45,
            child: _Decoration(
              icon: Icons.cloud_rounded,
              color: AppColors.white,
              size: 35,
            ),
          ),
          Positioned(
            left: 18,
            bottom: 30,
            child: _Decoration(
              icon: Icons.auto_awesome_rounded,
              color: AppColors.numbersDecorationOrange,
              size: 25,
            ),
          ),
          Positioned(
            right: 20,
            bottom: 35,
            child: _Decoration(
              icon: Icons.auto_awesome_rounded,
              color: AppColors.numbersDecorationPurple,
              size: 28,
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 400),
                  transitionBuilder: (child, animation) {
                    return ScaleTransition(
                      scale: animation,
                      child: child,
                    );
                  },
                  child: Text(
                    number.number,
                    key: ValueKey(number.number),
                    style: const TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 110,
                      height: .9,
                      fontWeight: FontWeight.w900,
                      color: AppColors.numbersPrimaryDark,
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                AnimatedSwitcher(
                  duration: const Duration(milliseconds: 350),
                  child: Container(
                    key: ValueKey(number.name),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 22,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.white,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      number.name,
                      style: const TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 27,
                        fontWeight: FontWeight.bold,
                        color: AppColors.numbersPrimaryDark,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'هيا نعد معًا! 🍎',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.numbersSecondaryText,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    )
        .animate(
          key: ValueKey(index),
        )
        .fadeIn(duration: 400.ms)
        .slideY(
          begin: .12,
          end: 0,
          duration: 450.ms,
          curve: Curves.easeOutBack,
        );
  }
}

class _Decoration extends StatelessWidget {
  const _Decoration({
    required this.icon,
    required this.color,
    required this.size,
  });

  final IconData icon;
  final Color color;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: color,
      size: size,
    )
        .animate(
          onPlay: (animation) {
            animation.repeat(reverse: true);
          },
        )
        .fadeIn()
        .scale(
          begin: const Offset(.8, .8),
          end: const Offset(1.1, 1.1),
          duration: 900.ms,
        );
  }
}
