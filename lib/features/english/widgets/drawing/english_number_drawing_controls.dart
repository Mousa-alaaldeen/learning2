import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../controllers/english_writing_numbers_controller.dart';

class EnglishNumberDrawingControls extends StatelessWidget {
  const EnglishNumberDrawingControls({
    super.key,
    required this.controller,
    required this.number,
  });

  final EnglishWritingNumbersController controller;
  final String number;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ControlButton(
            icon: Icons.arrow_back_rounded,
            onTap: controller.nextNumber,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          flex: 2,
          child: _NumberButton(
            number: number,
            onTap: controller.speakNumber,
          ),
        ),

        const SizedBox(width: 12),

        Expanded(
          child: _ControlButton(
            icon: Icons.arrow_forward_rounded,
            onTap: controller.previousNumber,
          ),
        ),
      ],
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
        child: SizedBox(
          height: 58,
          child: Center(
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

class _NumberButton extends StatelessWidget {
  const _NumberButton({
    required this.number,
    required this.onTap,
  });

  final String number;
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
                number,
                style: const TextStyle(
                  fontSize: 30,
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