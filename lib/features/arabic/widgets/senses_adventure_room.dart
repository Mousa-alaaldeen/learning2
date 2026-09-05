import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/game_decoration_icon.dart';
import '../controllers/senses_controller.dart';
import 'sense_portal.dart';

class SensesAdventureRoom extends StatelessWidget {
  const SensesAdventureRoom({
    super.key,
    required this.senses,
    required this.currentIndex,
    required this.onSelectSense,
  });

  final List<SenseItem> senses;
  final int currentIndex;
  final ValueChanged<int> onSelectSense;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 380,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(38),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.lettersBackgroundTop,
            AppColors.lettersBackgroundBottom,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 20,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 18,
            top: 30,
            child: GameDecorationIcon(
              icon: Icons.star_rounded,
              color: AppColors.numbersDecorationOrange,
              size: 30,
            ),
          ),

          Positioned(
            right: 20,
            top: 55,
            child: GameDecorationIcon(
              icon: Icons.cloud_rounded,
              color: AppColors.white,
              size: 35,
            ),
          ),

          Positioned(
            left: 15,
            bottom: 25,
            child: GameDecorationIcon(
              icon: Icons.auto_awesome_rounded,
              color: AppColors.arabicWriting,
              size: 25,
            ),
          ),

          Positioned(
            right: 18,
            bottom: 30,
            child: GameDecorationIcon(
              icon: Icons.auto_awesome_rounded,
              color: AppColors.lettersPurpleText,
              size: 28,
            ),
          ),

          // الشخصية

          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 125,
                  height: 125,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: const LinearGradient(
                      colors: [
                        AppColors.lettersAccent,
                        AppColors.lettersPrimaryDark,
                      ],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: AppColors.sensesCharacterShadow
                            .withOpacity(.35),
                        blurRadius: 25,
                        spreadRadius: 4,
                      ),
                    ],
                  ),
                  child: const Icon(
                    Icons.child_care_rounded,
                    size: 82,
                    color: AppColors.white,
                  ),
                )
                    .animate(
                      onPlay: (controller) => controller.repeat(
                        reverse: true,
                      ),
                    )
                    .moveY(
                      begin: -4,
                      end: 4,
                      duration: 900.ms,
                      curve: Curves.easeInOut,
                    ),

                const SizedBox(height: 10),

                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 18,
                    vertical: 8,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: const Text(
                    'هيا نلعب! 🎮',
                    style: TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 19,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lettersPurpleText,
                    ),
                  ),
                ),
              ],
            ),
          ),

          // الحاسة الأولى

          Positioned(
            left: 12,
            top: 105,
            child: SensePortal(
              sense: senses[0],
              selected: currentIndex == 0,
              onTap: () => onSelectSense(0),
            ),
          ),

          // الحاسة الثانية

          Positioned(
            right: 12,
            top: 105,
            child: SensePortal(
              sense: senses[1],
              selected: currentIndex == 1,
              onTap: () => onSelectSense(1),
            ),
          ),

          // الحاسة الثالثة

          Positioned(
            left: 12,
            bottom: 28,
            child: SensePortal(
              sense: senses[2],
              selected: currentIndex == 2,
              onTap: () => onSelectSense(2),
            ),
          ),

          // الحاسة الرابعة

          Positioned(
            right: 12,
            bottom: 28,
            child: SensePortal(
              sense: senses[3],
              selected: currentIndex == 3,
              onTap: () => onSelectSense(3),
            ),
          ),

          // الحاسة الخامسة

          Positioned(
            bottom: 4,
            left: 0,
            right: 0,
            child: Center(
              child: SensePortal(
                sense: senses[4],
                selected: currentIndex == 4,
                onTap: () => onSelectSense(4),
              ),
            ),
          ),
        ],
      ),
    );
  }
}