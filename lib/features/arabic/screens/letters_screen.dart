
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/letter_controller.dart';

class LettersScreen extends GetView<LetterController> {
  const LettersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Obx(
          () {
            final letter = controller.currentLetter;

            return Column(
              children: [
                _TopBar(),
                _Title(),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(
                      16,
                      8,
                      16,
                      12,
                    ),
                    child: Column(
                      children: [
                        Expanded(
                          child: _LetterAdventure(
                            letter: letter,
                          ),
                        ),

                        const SizedBox(height: 14),

                        _LetterInfo(
                          letter: letter,
                        ),

                        const SizedBox(height: 14),

                        _Navigation(),
                      ],
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  // ============================================================
  // TOP BAR
  // ============================================================

  Widget _TopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(
        14,
        10,
        14,
        4,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _RoundButton(
            icon: Icons.home_rounded,
            color: AppColors.lettersPrimary,
            onTap: () => Get.back(),
          ),

          Obx(
            () => Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 8,
              ),
              decoration: BoxDecoration(
                color: AppColors.lettersBlue,
                borderRadius: BorderRadius.circular(22),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.lettersBlue.withOpacity(.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Row(
                children: [
                  const Icon(
                    Icons.auto_stories_rounded,
                    color: Colors.white,
                    size: 24,
                  ),
                  const SizedBox(width: 6),
                  Text(
                    '${controller.currentIndex.value + 1}/${controller.letters.length}',
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w900,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          _RoundButton(
            icon: Icons.volume_up_rounded,
            color: AppColors.lettersBlueButton,
            onTap: controller.speakLetter,
          ),
        ],
      ),
    );
  }

  // ============================================================
  // TITLE
  // ============================================================

  Widget _Title() {
    return Column(
      children: [
        const Text(
          'مغامرة الحروف',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: AppColors.lettersTitle,
          ),
        )
            .animate()
            .fadeIn(duration: 500.ms)
            .slideY(
              begin: -.3,
              end: 0,
            ),

        const Text(
          'هيا نتعلم حرفًا جديدًا! 📚',
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColors.lettersSecondaryText,
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

  // ============================================================
  // LETTER ADVENTURE
  // ============================================================

  Widget _LetterAdventure({
    required dynamic letter,
  }) {
    return Container(
      width: double.infinity,

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
          // Star
          Positioned(
            left: 20,
            top: 25,
            child: _DecorationIcon(
              icon: Icons.star_rounded,
              color: Colors.amber,
              size: 30,
            ),
          ),

          // Cloud
          Positioned(
            right: 20,
            top: 40,
            child: _DecorationIcon(
              icon: Icons.cloud_rounded,
              color: Colors.white,
              size: 35,
            ),
          ),

          // Small star
          Positioned(
            left: 20,
            bottom: 30,
            child: _DecorationIcon(
              icon: Icons.auto_awesome_rounded,
              color: Colors.orange,
              size: 26,
            ),
          ),

          Positioned(
            right: 20,
            bottom: 35,
            child: _DecorationIcon(
              icon: Icons.auto_awesome_rounded,
              color: Colors.purple,
              size: 28,
            ),
          ),

          // Main content
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Icon
                Container(
                  width: 115,
                  height: 115,
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
                        color: AppColors.lettersPrimary.withOpacity(.35),
                        blurRadius: 25,
                        spreadRadius: 4,
                      ),
                    ],
                  ),

                  child: Center(
                    child: FaIcon(
                      letter.icon,
                      size: 60,
                      color: Colors.white,
                    ),
                  ),
                )
                    .animate(
                      onPlay: (controller) {
                        controller.repeat(reverse: true);
                      },
                    )
                    .moveY(
                      begin: -5,
                      end: 5,
                      duration: 900.ms,
                      curve: Curves.easeInOut,
                    ),

                const SizedBox(height: 70),

                // Letter
                Text(
                  letter.letter,
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 105,
                    height: .9,
                    fontWeight: FontWeight.w900,
                    color: AppColors.lettersText,
                  ),
                )
                    .animate()
                    .fadeIn(duration: 350.ms)
                    .scale(
                      begin: const Offset(.7, .7),
                      end: const Offset(1, 1),
                      duration: 500.ms,
                      curve: Curves.easeOutBack,
                    ),

                const SizedBox(height: 50),

                // Word
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 22,
                    vertical: 7,
                  ),

                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),

                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.07),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),

                  child: Text(
                    letter.word,
                    style: const TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 27,
                      fontWeight: FontWeight.bold,
                      color: AppColors.lettersPurpleText,
                    ),
                  ),
                )
                    .animate()
                    .fadeIn(
                      delay: 150.ms,
                      duration: 400.ms,
                    )
                    .slideY(
                      begin: .2,
                      end: 0,
                    ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // INFO
  // ============================================================

  Widget _LetterInfo({
    required dynamic letter,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 12,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 16,
            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,

            decoration: const BoxDecoration(
              color: AppColors.lettersBlue,
              shape: BoxShape.circle,
            ),

            child: const Icon(
              Icons.lightbulb_rounded,
              color: Colors.white,
              size: 28,
            ),
          ),

          const SizedBox(width: 12),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'الحرف والمثال',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lettersHint,
                  ),
                ),

                const SizedBox(height: 2),

                Text(
                  '${letter.letter} — ${letter.word}',
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 23,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lettersText,
                  ),
                ),
              ],
            ),
          ),

          Material(
            color: AppColors.lettersBlueLight,
            shape: const CircleBorder(),

            child: InkWell(
              onTap: controller.speakLetter,
              customBorder: const CircleBorder(),

              child: const SizedBox(
                width: 52,
                height: 52,

                child: Icon(
                  Icons.volume_up_rounded,
                  color: AppColors.lettersBlueButton,
                  size: 27,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ============================================================
  // NAVIGATION
  // ============================================================

  Widget _Navigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _GameButton(
          icon: Icons.arrow_back_rounded,
          enabled: !controller.isLast,
          onTap: controller.nextLetter,
        ),

        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 14,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),

              child: LinearProgressIndicator(
                value: controller.progress,
                minHeight: 8,

                backgroundColor:
                    AppColors.lettersProgressBackground,

                valueColor:
                    const AlwaysStoppedAnimation<Color>(
                  AppColors.lettersPrimary,
                ),
              ),
            ),
          ),
        ),

        _GameButton(
          icon: Icons.arrow_forward_rounded,
          enabled: !controller.isFirst,
          onTap: controller.previousLetter,
        ),
      ],
    );
  }
}

// ============================================================
// ROUND BUTTON
// ============================================================

class _RoundButton extends StatelessWidget {
  const _RoundButton({
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      shape: const CircleBorder(),
      elevation: 5,

      child: InkWell(
        onTap: onTap,
        customBorder: const CircleBorder(),

        child: SizedBox(
          width: 52,
          height: 52,

          child: Icon(
            icon,
            color: Colors.white,
            size: 27,
          ),
        ),
      ),
    );
  }
}

// ============================================================
// GAME BUTTON
// ============================================================

class _GameButton extends StatelessWidget {
  const _GameButton({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: enabled ? 1 : .35,

      duration: const Duration(
        milliseconds: 200,
      ),

      child: Material(
        color: AppColors.lettersPrimary,
        borderRadius: BorderRadius.circular(18),
        elevation: 4,

        child: InkWell(
          onTap: enabled ? onTap : null,
          borderRadius: BorderRadius.circular(18),

          child: SizedBox(
            width: 58,
            height: 52,

            child: Icon(
              icon,
              color: Colors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// DECORATION ICON
// ============================================================

class _DecorationIcon extends StatelessWidget {
  const _DecorationIcon({
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
          onPlay: (controller) {
            controller.repeat(reverse: true);
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