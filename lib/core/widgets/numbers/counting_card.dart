import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';
import 'apple_item.dart';

class CountingCard extends StatelessWidget {
  const CountingCard({
    super.key,
    required this.visibleObjects,
    required this.currentIndex,
    required this.totalNumbers,
    required this.isCounting,
    required this.onCount,
  });

  final int visibleObjects;
  final int currentIndex;
  final int totalNumbers;
  final bool isCounting;
  final VoidCallback onCount;

  @override
  Widget build(BuildContext context) {
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
                '${currentIndex + 1}/$totalNumbers',
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
              child: visibleObjects == 0
                  ? const Text(
                      'استعد للعد! 🍎',
                      style: TextStyle(
                        fontFamily: 'Amiri',
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: AppColors.numbersHint,
                      ),
                    )
                  : Wrap(
                      alignment: WrapAlignment.center,
                      spacing: 10,
                      runSpacing: 10,
                      children: List.generate(
                        visibleObjects,
                        (index) => AppleItem(
                          number: index + 1,
                        ),
                      ),
                    ),
            ),
          ),
          const SizedBox(height: 8),
          Material(
            color: AppColors.numbersGreen,
            borderRadius: BorderRadius.circular(18),
            elevation: 3,
            child: InkWell(
              onTap: isCounting ? null : onCount,
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
                      isCounting ? 'نعد...' : 'أعد معي',
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
}
