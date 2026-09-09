import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/english_colors_controller.dart';

class EnglishColorsScreen extends GetView<EnglishColorsController> {
  const EnglishColorsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Obx(
          () {
            final selected = controller.selectedColor;

            return Column(
              children: [
                const SizedBox(height: 20),
                Text(
                  'Colors 🎨',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey.shade800,
                  ),
                ),
                const SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 12,
                    runSpacing: 12,
                    children: List.generate(
                      controller.colors.length,
                      (index) {
                        final color = controller.colors[index];
                        final isSelected =
                            controller.selectedIndex.value == index;

                        return GestureDetector(
                          onTap: () => controller.selectColor(index),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 250),
                            width: isSelected ? 65 : 56,
                            height: isSelected ? 65 : 56,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Color(color.colorValue),
                              border: Border.all(
                                color: isSelected
                                    ? Colors.white
                                    : Colors.transparent,
                                width: 4,
                              ),
                              boxShadow: [
                                BoxShadow(
                                  color:
                                      Color(color.colorValue).withOpacity(0.35),
                                  blurRadius: isSelected ? 12 : 6,
                                  spreadRadius: isSelected ? 2 : 0,
                                ),
                              ],
                            ),
                            child: isSelected
                                ? const Icon(
                                    Icons.check_rounded,
                                    color: Colors.white,
                                    size: 30,
                                  )
                                : null,
                          ),
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(height: 25),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 0, 20, 20),
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 400),
                      transitionBuilder: (child, animation) {
                        return FadeTransition(
                          opacity: animation,
                          child: ScaleTransition(
                            scale: Tween<double>(
                              begin: 0.92,
                              end: 1,
                            ).animate(
                              CurvedAnimation(
                                parent: animation,
                                curve: Curves.easeOutBack,
                              ),
                            ),
                            child: child,
                          ),
                        );
                      },
                      child: _EnglishColorCard(
                        key: ValueKey(controller.selectedIndex.value),
                        name: selected.name,
                        example: selected.example,
                        emoji: selected.emoji,
                        color: Color(selected.colorValue),
                        onSpeak: controller.speakColor,
                      ),
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
}

class _EnglishColorCard extends StatelessWidget {
  final String name;
  final String example;
  final String emoji;
  final Color color;
  final VoidCallback onSpeak;

  const _EnglishColorCard({
    super.key,
    required this.name,
    required this.example,
    required this.emoji,
    required this.color,
    required this.onSpeak,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(35),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(0.20),
            blurRadius: 25,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 170,
            height: 170,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: color,
              boxShadow: [
                BoxShadow(
                  color: color.withOpacity(0.35),
                  blurRadius: 25,
                  spreadRadius: 5,
                ),
              ],
            ),
            child: Center(
              child: Text(
                emoji,
                style: const TextStyle(fontSize: 85),
              ),
            ),
          )
              .animate()
              .scale(
                duration: 500.ms,
                curve: Curves.elasticOut,
              )
              .fadeIn(),
          const SizedBox(height: 25),
          Text(
            name,
            style: TextStyle(
              fontSize: 38,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Like $example',
            style: TextStyle(
              fontSize: 23,
              fontWeight: FontWeight.w600,
              color: Colors.grey.shade700,
            ),
          ),
          const SizedBox(height: 25),
          GestureDetector(
            onTap: onSpeak,
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 28,
                vertical: 13,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.volume_up_rounded,
                    color: Colors.white,
                    size: 28,
                  ),
                  SizedBox(width: 10),
                  Text(
                    'Listen',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
