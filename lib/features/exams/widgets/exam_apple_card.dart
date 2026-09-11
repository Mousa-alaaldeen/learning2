import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class ExamAppleCard extends StatelessWidget {
  final Map<String, dynamic> item;
  final bool dragging;

  const ExamAppleCard({
    super.key,
    required this.item,
    this.dragging = false,
  });

  @override
  Widget build(BuildContext context) {
    final count = item['count'] as int;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      constraints: const BoxConstraints(
        minHeight: 90,
      ),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: AppColors.arabicNumbers.withOpacity(.25),
          width: 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(
              dragging ? .15 : .06,
            ),
            blurRadius: dragging ? 16 : 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 2,
            runSpacing: 2,
            children: List.generate(
              count,
              (_) => const Text(
                '🍎',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
            ),
          ),
          const SizedBox(height: 5),
          Text(
            item['number'],
            style: const TextStyle(
              fontFamily: 'Amiri',
              fontSize: 22,
              fontWeight: FontWeight.w900,
            ),
          ),
        ],
      ),
    );
  }
}