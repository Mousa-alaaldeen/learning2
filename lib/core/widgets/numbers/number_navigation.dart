
import 'package:flutter/material.dart';

import '../../theme/app_colors.dart';

class NumberNavigation extends StatelessWidget {
  const NumberNavigation({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.onPrevious,
    required this.onNext,
    required this.onSpeak,
  });

  final bool isFirst;
  final bool isLast;
  final VoidCallback onPrevious;
  final VoidCallback onNext;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _Button(
          icon: Icons.arrow_back_rounded,
          enabled: !isFirst,
          onTap: onPrevious,
        ),

        _Button(
          icon: Icons.volume_up_rounded,
          enabled: true,
          onTap: onSpeak,
        ),

        _Button(
          icon: Icons.arrow_forward_rounded,
          enabled: !isLast,
          onTap: onNext,
        ),
      ],
    );
  }
}

class _Button extends StatelessWidget {
  const _Button({
    required this.icon,
    required this.enabled,
    required this.onTap,
  });

  final IconData icon;
  final bool enabled;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: enabled ? 1 : .35,
      duration: const Duration(milliseconds: 200),
      child: Material(
        color: AppColors.numbersPrimary,
        borderRadius: BorderRadius.circular(18),
        elevation: 4,
        child: InkWell(
          onTap: enabled ? onTap : null,
          borderRadius: BorderRadius.circular(18),
          child: SizedBox(
            width: 58,
            height: 52,
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
