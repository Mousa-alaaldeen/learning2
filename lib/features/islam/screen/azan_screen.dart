import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/widgets/common/game_title.dart';
import '../../../core/widgets/common/game_top_bar.dart';
import '../../../data/local/learning_data.dart';
import '../controllers/azan_controller.dart';

class AzanScreen extends GetView<AzanController> {
  const AzanScreen({super.key});

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
                'الأذان',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w900,
                  color: AppColors.lettersTitle,
                ),
              ),
            ),
            const GameTitle(
              title: 'الأذان ودعاء الأذان',
              subtitle: 'هيا نتعلم الأذان معًا! 🕌',
              titleColor: AppColors.lettersTitle,
            ),
            Expanded(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                child: Obx(
                  () => Column(
                    children: [
                      ...List.generate(
                        LearningData.azanParts.length,
                        (index) {
                          final part = LearningData.azanParts[index];

                          return _AzanCard(
                            title: part['title']!,
                            description: part['description']!,
                            emoji: part['emoji']!,
                            index: index,
                            isSpeaking: controller.speakingIndex.value == index,
                            onSpeak: () {
                              controller.speakAzan(index);
                            },
                          );
                        },
                      ),
                      _AzanCard(
                        title: LearningData.dua['title']!,
                        description: LearningData.dua['description']!,
                        emoji: LearningData.dua['emoji']!,
                        index: LearningData.azanParts.length,
                        isSpeaking: controller.speakingIndex.value ==
                            LearningData.azanParts.length,
                        onSpeak: controller.speakDua,
                      ),
                    ],
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

class _AzanCard extends StatelessWidget {
  const _AzanCard({
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
    final color = index.isEven ? AppColors.arabicLetters : AppColors.sensesBlue;

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
                    style: const TextStyle(fontSize: 31),
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
                    fontSize: 21,
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
                    ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
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
                height: 1.7,
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
          delay: (index * 80).ms,
          duration: 400.ms,
        )
        .slideY(
          begin: .1,
          end: 0,
          duration: 450.ms,
        );
  }
}
