// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/game_progress_badge.dart';
import '../../../core/widgets/common/game_title.dart';
import '../../../core/widgets/common/game_top_bar.dart';
import '../controllers/english_week_days_controller.dart';

class EnglishWeekDaysScreen extends GetView<EnglishWeekDaysController> {
  const EnglishWeekDaysScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 20),
          child: Column(
            children: [
              GameTopBar(
                onHome: () => Get.back(),
                onSpeak: controller.speakCurrentDay,
                center: Obx(
                  () => GameProgressBadge(
                    current: controller.currentIndex.value + 1,
                    total: controller.days.length,
                    color: AppColors.lettersBlue,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              const GameTitle(
                title: 'Days of the Week 📅',
                subtitle: 'Learn the days of the week',
                titleColor: AppColors.lettersTitle,
              ),
              const SizedBox(height: 20),
              Expanded(
                child: Obx(
                  () {
                    final day = controller.currentDay;

                    return Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(28),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.08),
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            decoration: BoxDecoration(
                              color: AppColors.arabicLetters.withOpacity(0.12),
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${day.value}',
                                style: const TextStyle(
                                  fontSize: 58,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.lettersTitle,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          Text(
                            day.day,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 42,
                              fontWeight: FontWeight.bold,
                              color: AppColors.lettersTitle,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            'Day ${day.value}',
                            style: const TextStyle(
                              fontSize: 20,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              const SizedBox(height: 16),
              Obx(
                () => Row(
                  children: [
                    Expanded(
                      child: _ControlButton(
                        icon: Icons.arrow_back_rounded,
                        onTap: controller.previousDay,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      flex: 2,
                      child: _SpeakButton(
                        day: controller.currentDay.name,
                        onTap: controller.speakCurrentDay,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _ControlButton(
                        icon: Icons.arrow_forward_rounded,
                        onTap: controller.nextDay,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ControlButton extends StatelessWidget {
  const _ControlButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: const SizedBox(
          height: 58,
          child: Center(
            child: Icon(
              Icons.arrow_back_rounded,
              color: AppColors.white,
              size: 28,
            ),
          ),
        ),
      ),
    );
  }
}

class _SpeakButton extends StatelessWidget {
  const _SpeakButton({
    required this.day,
    required this.onTap,
  });

  final String day;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: AppColors.primary,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(20),
        child: SizedBox(
          height: 58,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                day,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: AppColors.white,
                ),
              ),
              const SizedBox(width: 10),
              const Icon(
                Icons.volume_up_rounded,
                color: AppColors.white,
                size: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}