import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../controllers/senses_controller.dart';

class SensesAnswerGrid extends StatelessWidget {
  const SensesAnswerGrid({
    super.key,
    required this.options,
    required this.currentIndex,
    required this.highlightedOptionIndex,
    required this.isTeaching,
    required this.onAnswer,
  });

  final List<SenseOption> options;
  final int currentIndex;
  final RxInt highlightedOptionIndex;
  final RxBool isTeaching;
  final ValueChanged<int> onAnswer;

  @override
  Widget build(BuildContext context) {
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
              highlightedOptionIndex.value == index;

          final teaching = isTeaching.value;

          return GestureDetector(
            onTap: teaching
                ? null
                : () => onAnswer(index),
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
                    '$currentIndex-$index',
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
}