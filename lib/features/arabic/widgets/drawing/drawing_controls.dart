import 'package:flutter/material.dart';

import '../../../../core/theme/app_colors.dart';
import '../../controllers/writing_controller.dart';

class DrawingControls extends StatelessWidget {
  const DrawingControls({
    super.key,
    required this.controller,
    required this.letter,
  });

  final WritingController controller;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: _ControlButton(
            icon: Icons.arrow_back_rounded,
            onTap: controller.nextLetter,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          flex: 2,
          child: _LetterButton(
            letter: letter,
            onTap: controller.speakLetter,
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: _ControlButton(
            icon: Icons.arrow_forward_rounded,
            onTap: controller.previousLetter,
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

class _LetterButton extends StatelessWidget {
  const _LetterButton({
    required this.letter,
    required this.onTap,
  });

  final String letter;
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
                letter,
                style: const TextStyle(
                  fontFamily: 'Amiri',
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
