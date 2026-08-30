import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/number_controller.dart';

class NumbersScreen extends GetView<NumberController> {
  const NumbersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(
          () => Column(
            children: [
              _buildTopBar(),
              _buildTitle(),
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
                      _buildNumberCard(),
                      const SizedBox(height: 18),
                      _buildCountingCard(),
                      const SizedBox(height: 18),
                      _buildNavigation(),
                    ],
                  ),
                ),
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

  Widget _buildTopBar() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(14, 10, 14, 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildCircleButton(
            icon: Icons.home_rounded,
            color: AppColors.numbersPrimary,
            onTap: () => Get.back(),
          ),
          _buildStars(),
          _buildCircleButton(
            icon: Icons.volume_up_rounded,
            color: AppColors.numbersBlueButton,
            onTap: controller.speakNumber,
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // TITLE
  // ==========================================================

  Widget _buildTitle() {
    return Column(
      children: [
        const Text(
          'مغامرة الأرقام',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 32,
            fontWeight: FontWeight.w900,
            color: AppColors.numbersTitle,
          ),
        ).animate().fadeIn(duration: 500.ms).slideY(
              begin: -0.3,
              end: 0,
            ),
        const Text(
          'هيا نتعلم الأرقام ونعد معًا! 🔢',
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 17,
            fontWeight: FontWeight.bold,
            color: AppColors.numbersSecondaryText,
          ),
        ),
      ],
    );
  }

  // ==========================================================
  // NUMBER CARD
  // ==========================================================

  Widget _buildNumberCard() {
    final number = controller.currentNumber;

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
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 18,
            top: 25,
            child: _buildDecoration(
              Icons.star_rounded,
              AppColors.numbersDecorationAmber,
              30,
            ),
          ),
          Positioned(
            right: 20,
            top: 45,
            child: _buildDecoration(
              Icons.cloud_rounded,
              AppColors.white,
              35,
            ),
          ),
          Positioned(
            left: 18,
            bottom: 30,
            child: _buildDecoration(
              Icons.auto_awesome_rounded,
              AppColors.numbersDecorationOrange,
              25,
            ),
          ),
          Positioned(
            right: 20,
            bottom: 35,
            child: _buildDecoration(
              Icons.auto_awesome_rounded,
              AppColors.numbersDecorationPurple,
              28,
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
          key: ValueKey(controller.currentIndex.value),
        )
        .fadeIn(duration: 400.ms)
        .slideY(
          begin: .12,
          end: 0,
          duration: 450.ms,
          curve: Curves.easeOutBack,
        );
  }

  // ==========================================================
  // COUNTING CARD
  // ==========================================================

  Widget _buildCountingCard() {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 18,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 52,
                height: 52,
                decoration: const BoxDecoration(
                  color: AppColors.numbersGreen,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.format_list_numbered_rounded,
                  color: AppColors.white,
                  size: 28,
                ),
              ),
              const SizedBox(width: 10),
              const Expanded(
                child: Text(
                  'نعد التفاحات',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.numbersText,
                  ),
                ),
              ),
              Text(
                '${controller.currentIndex.value + 1}/${controller.numbers.length}',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: AppColors.numbersHint,
                ),
              ),
            ],
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 260,
            child: Center(
              child: _buildApples(),
            ),
          ),
          const SizedBox(height: 8),
          Material(
            color: AppColors.numbersGreen,
            borderRadius: BorderRadius.circular(18),
            elevation: 3,
            child: InkWell(
              onTap:
                  controller.isCounting.value ? null : controller.playCounting,
              borderRadius: BorderRadius.circular(18),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 22,
                  vertical: 11,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.volume_up_rounded,
                      color: AppColors.white,
                      size: 22,
                    ),
                    const SizedBox(width: 7),
                    Text(
                      controller.isCounting.value ? 'نعد...' : 'أعد معي',
                      style: const TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // ==========================================================
  // APPLES
  // ==========================================================

  Widget _buildApples() {
    final count = controller.visibleObjects.value;

    if (count == 0) {
      return const Text(
        'استعد للعد! 🍎',
        style: TextStyle(
          fontFamily: 'Amiri',
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: AppColors.numbersHint,
        ),
      ).animate().fadeIn().scale();
    }

    return Wrap(
      alignment: WrapAlignment.center,
      spacing: 10,
      runSpacing: 10,
      children: List.generate(
        count,
        (index) {
          return _buildApple(
            index + 1,
            index,
          );
        },
      ),
    );
  }

  Widget _buildApple(int number, int index) {
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

  // ==========================================================
  // NAVIGATION
  // ==========================================================

  Widget _buildNavigation() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildGameButton(
          icon: Icons.arrow_back_rounded,
          enabled: !controller.isLast,
          onTap: controller.nextNumber,
        ),
        _buildGameButton(
          icon: Icons.volume_up_rounded,
          enabled: true,
          onTap: controller.speakNumber,
        ),
        _buildGameButton(
          icon: Icons.arrow_forward_rounded,
          enabled: !controller.isFirst,
          onTap: controller.previousNumber,
        ),
      ],
    );
  }

  // ==========================================================
  // BUTTONS
  // ==========================================================

  Widget _buildCircleButton({
    required IconData icon,
    required Color color,
    required VoidCallback onTap,
  }) {
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

  Widget _buildGameButton({
    required IconData icon,
    required bool enabled,
    required VoidCallback onTap,
  }) {
    return AnimatedOpacity(
      opacity: enabled ? 1 : .35,
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: AppColors.numbersPrimary,
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

  // ==========================================================
  // STARS
  // ==========================================================

  Widget _buildStars() {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 15,
        vertical: 8,
      ),
      decoration: BoxDecoration(
        color: AppColors.numbersYellow,
        borderRadius: BorderRadius.circular(22),
        boxShadow: [
          BoxShadow(
            color: AppColors.numbersYellow.withOpacity(.25),
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
            '${controller.totalStars.value}',
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

  // ==========================================================
  // DECORATION
  // ==========================================================

  Widget _buildDecoration(
    IconData icon,
    Color color,
    double size,
  ) {
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

  // ==========================================================
  // ARABIC DIGITS
  // ==========================================================

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

    if (number < 0 || number > 9) {
      return number.toString();
    }

    return digits[number];
  }
}
