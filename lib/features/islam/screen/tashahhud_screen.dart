import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/game_title.dart';
import '../../../core/widgets/common/game_top_bar.dart';
import '../../../data/local/learning_data.dart';
import '../controllers/tashahhud_controller.dart';

class TashahhudScreen extends GetView<TashahhudController> {
  const TashahhudScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            GameTopBar(
              onHome: () => Get.back(),
              onSpeak: controller.speakCurrent,
              center: const Text(
                'الصلاة',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: AppColors.lettersTitle,
                ),
              ),
            ),
            const GameTitle(
              title: 'التشهد والصلاة الإبراهيمية',
              subtitle: 'هيا نتعلم ما نقوله في الصلاة 🤲',
              titleColor: AppColors.lettersTitle,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: Obx(
                  () => Column(
                    children: List.generate(
                      LearningData.tashahhud.length,
                      (index) {
                        final part = LearningData.tashahhud[index];

                        return _PrayerCard(
                          title: part['title']!,
                          description: part['description']!,
                          emoji: part['emoji']!,
                          index: index,
                          isSpeaking: controller.speakingIndex.value == index,
                          onSpeak: () {
                            controller.speakPart(index);
                          },
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _PrayerCard extends StatelessWidget {
  const _PrayerCard({
    required this.title,
    required this.description,
    required this.emoji,
    required this.index,
    required this.isSpeaking,
    required this.onSpeak,
  });

  final String title;
  final String description;
  final String emoji;
  final int index;
  final bool isSpeaking;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    final color = index == 0
        ? AppColors.arabicLetters
        : AppColors.numbersDecorationPurple;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSpeaking ? color.withOpacity(.10) : Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color: isSpeaking ? color.withOpacity(.45) : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(
              isSpeaking ? .28 : .14,
            ),
            blurRadius: isSpeaking ? 24 : 16,
            spreadRadius: isSpeaking ? 2 : 0,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      color,
                      Color.lerp(
                        color,
                        Colors.black,
                        .15,
                      )!,
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    emoji,
                    style: const TextStyle(
                      fontSize: 31,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF293657),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: onSpeak,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: isSpeaking ? color : color.withOpacity(.12),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Icon(
                    isSpeaking ? Icons.stop_rounded : Icons.volume_up_rounded,
                    color: isSpeaking ? Colors.white : color,
                    size: 28,
                  ),
                ).animate(target: isSpeaking ? 1 : 0).scale(
                      begin: const Offset(.9, .9),
                      end: const Offset(1.08, 1.08),
                      duration: 500.ms,
                      curve: Curves.easeInOut,
                    ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 18,
            ),
            decoration: BoxDecoration(
              color: isSpeaking ? Colors.white : color.withOpacity(.06),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Amiri',
                fontSize: 20,
                height: 1.9,
                fontWeight: FontWeight.bold,
                color: isSpeaking ? color : const Color(0xFF59657F),
              ),
            ),
          ),
          if (isSpeaking)
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Text(
                'استمع واقرأ معي 🔊',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ),
        ],
      ),
    )
        .animate()
        .fadeIn(
          delay: (index * 120).ms,
          duration: 450.ms,
        )
        .slideY(
          begin: .12,
          end: 0,
          duration: 500.ms,
        );
  }
}
