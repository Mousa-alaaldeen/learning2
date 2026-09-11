
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:test1/core/theme/app_colors.dart';

class AblutionStepCard extends StatelessWidget {
  const AblutionStepCard({super.key, 
    required this.title,
    required this.description,
    required this.emoji,
    required this.index,
    required this.isSelected,
    required this.isSpeaking,
    required this.onTap,
    required this.onSpeak,
  });

  final String title;
  final String description;
  final String emoji;
  final int index;
  final bool isSelected;
  final bool isSpeaking;
  final VoidCallback onTap;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    final color = index.isEven
        ? AppColors.arabicLetters
        : AppColors.sensesBlue;

    final active = isSelected || isSpeaking;

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 350),
        width: double.infinity,
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: active
              ? color.withOpacity(.10)
              : Colors.white,
          borderRadius: BorderRadius.circular(28),
          border: Border.all(
            color: active
                ? color.withOpacity(.45)
                : Colors.transparent,
            width: 2,
          ),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(
                active ? .28 : .14,
              ),
              blurRadius: active ? 24 : 16,
              spreadRadius: active ? 2 : 0,
              offset: const Offset(0, 7),
            ),
          ],
        ),
        child: Column(
          children: [
            Row(
              children: [
                AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: active ? 68 : 62,
                  height: active ? 68 : 62,
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
                      style: TextStyle(
                        fontSize: active ? 35 : 31,
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.end,
                    children: [
                      Text(
                        '${index + 1}. $title',
                        textAlign: TextAlign.right,
                        style: const TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 21,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF293657),
                        ),
                      ),
                      if (!active)
                        const SizedBox(height: 3),
                      if (!active)
                        Text(
                          'اضغط للتعلم',
                          style: TextStyle(
                            fontFamily: 'Amiri',
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: color,
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: onSpeak,
                  child: AnimatedContainer(
                    duration:
                        const Duration(milliseconds: 300),
                    width: 52,
                    height: 52,
                    decoration: BoxDecoration(
                      color: isSpeaking
                          ? color
                          : color.withOpacity(.12),
                      borderRadius:
                          BorderRadius.circular(17),
                    ),
                    child: Icon(
                      isSpeaking
                          ? Icons.stop_rounded
                          : Icons.volume_up_rounded,
                      color: isSpeaking
                          ? Colors.white
                          : color,
                      size: 28,
                    ),
                  ),
                )
                    .animate(
                      target: isSpeaking ? 1 : 0,
                    )
                    .scale(
                      begin: const Offset(.9, .9),
                      end: const Offset(1.08, 1.08),
                      duration: 500.ms,
                      curve: Curves.easeInOut,
                    ),
              ],
            ),
            if (active) ...[
              const SizedBox(height: 14),
              AnimatedContainer(
                duration:
                    const Duration(milliseconds: 300),
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 14,
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius:
                      BorderRadius.circular(20),
                ),
                child: Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 19,
                    height: 1.7,
                    fontWeight: FontWeight.bold,
                    color: color,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              Text(
                isSpeaking
                    ? 'استمع واقرأ معي 🔊'
                    : 'خطوة ${index + 1} من ${8}',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ],
        ),
      ),
    )
        .animate()
        .fadeIn(
          delay: (index * 70).ms,
          duration: 400.ms,
        )
        .slideY(
          begin: .08,
          end: 0,
          duration: 450.ms,
        );
  }
}
