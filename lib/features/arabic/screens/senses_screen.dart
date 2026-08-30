import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/senses_controller.dart';

class SensesScreen extends GetView<SensesController> {
  const SensesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(
          () => Stack(
            children: [
              _Background(),
              Column(
                children: [
                  _TopBar(),
                  _GameTitle(),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      padding: const EdgeInsets.fromLTRB(
                        16,
                        8,
                        16,
                        24,
                      ),
                      child: Column(
                        children: [
                          _AdventureRoom(),
                          const SizedBox(height: 18),
                          _ChallengeArea(),
                          const SizedBox(height: 18),
                          _Navigation(),
                          const SizedBox(height: 10),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  // ==========================================================
  // TOP BAR
  // ==========================================================

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
            color: AppColors.numbersBlueButton,
            onTap: () => Get.back(),
          ),
          Obx(
            () => _StarsCounter(
              stars: controller.totalStars.value,
            ),
          ),
          _RoundButton(
            icon: Icons.volume_up_rounded,
            color: AppColors.lettersBlueButton,
            onTap: controller.speakCurrent,
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // TITLE
  // ==========================================================

  Widget _GameTitle() {
    return Column(
      children: [
        const Text(
          'مغامرة الحواس',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: AppColors.lettersTitle,
          ),
        ).animate().fadeIn(duration: 500.ms).slideY(
              begin: -0.3,
              end: 0,
            ),
        const Text(
          'هيا نكتشف العالم من حولنا!',
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColors.lettersSecondaryText,
          ),
        )
            .animate()
            .fadeIn(
              delay: 200.ms,
            )
            .slideY(
              begin: -0.2,
              end: 0,
            ),
      ],
    );
  }

  // ==========================================================
  // ADVENTURE ROOM
  // ==========================================================

  Widget _AdventureRoom() {
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
            child: _DecorationIcon(
              icon: Icons.star_rounded,
              color: AppColors.numbersDecorationOrange,
              size: 30,
            ),
          ),

          Positioned(
            right: 20,
            top: 55,
            child: _DecorationIcon(
              icon: Icons.cloud_rounded,
              color: AppColors.white,
              size: 35,
            ),
          ),

          Positioned(
            left: 15,
            bottom: 25,
            child: _DecorationIcon(
              icon: Icons.auto_awesome_rounded,
              color: AppColors.arabicWriting,
              size: 25,
            ),
          ),

          Positioned(
            right: 18,
            bottom: 30,
            child: _DecorationIcon(
              icon: Icons.auto_awesome_rounded,
              color: AppColors.lettersPurpleText,
              size: 28,
            ),
          ),

          // ==================================================
          // CHARACTER
          // ==================================================

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
                        color: AppColors.sensesCharacterShadow.withOpacity(.35),
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

          // ==================================================
          // SENSE 1
          // ==================================================

          Positioned(
            left: 12,
            top: 105,
            child: _SensePortal(
              sense: controller.senses[0],
              selected: controller.currentIndex.value == 0,
              onTap: () => controller.selectSense(0),
            ),
          ),

          // ==================================================
          // SENSE 2
          // ==================================================

          Positioned(
            right: 12,
            top: 105,
            child: _SensePortal(
              sense: controller.senses[1],
              selected: controller.currentIndex.value == 1,
              onTap: () => controller.selectSense(1),
            ),
          ),

          // ==================================================
          // SENSE 3
          // ==================================================

          Positioned(
            left: 12,
            bottom: 28,
            child: _SensePortal(
              sense: controller.senses[2],
              selected: controller.currentIndex.value == 2,
              onTap: () => controller.selectSense(2),
            ),
          ),

          // ==================================================
          // SENSE 4
          // ==================================================

          Positioned(
            right: 12,
            bottom: 28,
            child: _SensePortal(
              sense: controller.senses[3],
              selected: controller.currentIndex.value == 3,
              onTap: () => controller.selectSense(3),
            ),
          ),

          // ==================================================
          // SENSE 5
          // ==================================================

          Positioned(
            bottom: 4,
            left: 0,
            right: 0,
            child: Center(
              child: _SensePortal(
                sense: controller.senses[4],
                selected: controller.currentIndex.value == 4,
                onTap: () => controller.selectSense(4),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // CHALLENGE
  // ==========================================================

  Widget _ChallengeArea() {
    final sense = controller.currentSense;

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              _MiniSenseIcon(
                icon: sense.icon,
                color: sense.color,
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Text(
                  sense.name,
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.lettersText,
                  ),
                ),
              ),
              Text(
                '${controller.currentIndex.value + 1}/5',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.lettersHint,
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 18,
              vertical: 13,
            ),
            decoration: BoxDecoration(
              color: sense.color.withOpacity(.18),
              borderRadius: BorderRadius.circular(18),
            ),
            child: Text(
              controller.questionForCurrent,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontFamily: 'Amiri',
                fontSize: 21,
                fontWeight: FontWeight.bold,
                color: AppColors.lettersText,
              ),
            ),
          ),
          const SizedBox(height: 15),
          _AnswerGrid(),
        ],
      ),
    )
        .animate(
          key: ValueKey(
            controller.currentIndex.value,
          ),
        )
        .fadeIn(
          duration: 400.ms,
        )
        .slideY(
          begin: .15,
          end: 0,
          duration: 450.ms,
          curve: Curves.easeOutBack,
        );
  }

  // ==========================================================
  // ANSWER GRID
  // ==========================================================

  Widget _AnswerGrid() {
    final options = controller.optionsForCurrent;

    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: options.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
        childAspectRatio: 1,
      ),
      itemBuilder: (_, index) {
        final option = options[index];

        return Obx(() {
          final isHighlighted =
              controller.highlightedOptionIndex.value == index;

          final isTeaching = controller.isTeaching.value;

          return GestureDetector(
            onTap: isTeaching
                ? null
                : () => controller.checkAnswer(
                      index,
                      Get.context!,
                    ),
            child: AnimatedScale(
              scale: isHighlighted ? 1.12 : 1,
              duration: const Duration(milliseconds: 350),
              curve: Curves.easeOutBack,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 350),
                decoration: BoxDecoration(
                  color: option.color,
                  borderRadius: BorderRadius.circular(22),
                  border: Border.all(
                    color: AppColors.white,
                    width: isHighlighted ? 5 : 3,
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: option.color.withOpacity(
                        isHighlighted ? .75 : .35,
                      ),
                      blurRadius: isHighlighted ? 28 : 10,
                      spreadRadius: isHighlighted ? 5 : 0,
                      offset: const Offset(0, 5),
                    ),
                  ],
                ),
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          option.icon,
                          size: isHighlighted ? 52 : 43,
                          color: AppColors.white,
                        ),
                        const SizedBox(height: 5),
                        Text(
                          option.name,
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: isHighlighted ? 18 : 16,
                            fontWeight: FontWeight.bold,
                            color: AppColors.white,
                          ),
                        ),
                      ],
                    ),
                    if (isHighlighted)
                      Positioned.fill(
                        child: IgnorePointer(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(22),
                              border: Border.all(
                                color: AppColors.white.withOpacity(.8),
                                width: 3,
                              ),
                            ),
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            )
                .animate(
                  key: ValueKey(
                    '${controller.currentIndex.value}-$index',
                  ),
                )
                .fadeIn(
                  delay: (100 * index).ms,
                  duration: 400.ms,
                )
                .scale(
                  begin: const Offset(.8, .8),
                  end: const Offset(1, 1),
                  duration: 450.ms,
                  curve: Curves.easeOutBack,
                ),
          );
        });
      },
    );
  }

  // ==========================================================
  // NAVIGATION
  // ==========================================================

  Widget _Navigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _GameButton(
          icon: Icons.arrow_back_rounded,
          enabled: !controller.isLast,
          onTap: controller.nextSense,
        ),
        _GameButton(
          icon: Icons.volume_up_rounded,
          enabled: true,
          onTap: controller.speakCurrent,
        ),
        _GameButton(
          icon: Icons.arrow_forward_rounded,
          enabled: !controller.isFirst,
          onTap: controller.previousSense,
        ),
      ],
    );
  }
}

// ============================================================
// SENSE PORTAL
// ============================================================

class _SensePortal extends StatelessWidget {
  const _SensePortal({
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

// ============================================================
// MINI ICON
// ============================================================

class _MiniSenseIcon extends StatelessWidget {
  const _MiniSenseIcon({
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: AppColors.white,
        size: 28,
      ),
    );
  }
}

// ============================================================
// STARS
// ============================================================

class _StarsCounter extends StatelessWidget {
  const _StarsCounter({
    required this.stars,
  });

  final int stars;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.arabicLetters,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.arabicLetters.withOpacity(.25),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        children: [
          const Icon(
            Icons.star_rounded,
            color: AppColors.white,
            size: 27,
          ),
          const SizedBox(width: 4),
          Text(
            '$stars',
            style: const TextStyle(
              fontSize: 19,
              fontWeight: FontWeight.w900,
              color: AppColors.white,
            ),
          ),
        ],
      ),
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
        child: const SizedBox(
          width: 52,
          height: 52,
          child: Icon(
            Icons.volume_up_rounded,
            color: AppColors.white,
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
      duration: const Duration(milliseconds: 200),
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
              color: AppColors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}

// ============================================================
// DECORATION
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
          onPlay: (controller) => controller.repeat(
            reverse: true,
          ),
        )
        .fadeIn()
        .scale(
          begin: const Offset(.8, .8),
          end: const Offset(1.1, 1.1),
          duration: 900.ms,
        );
  }
}

// ============================================================
// BACKGROUND
// ============================================================

class _Background extends StatelessWidget {
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
                  color: AppColors.sensesBackgroundCircleBlue.withOpacity(.45),
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
                  color: AppColors.sensesBackgroundCirclePurple.withOpacity(.4),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
