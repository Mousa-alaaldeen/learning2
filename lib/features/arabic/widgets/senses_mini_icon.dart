import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';

class SensesMiniIcon extends StatelessWidget {
  const SensesMiniIcon({
    super.key,
    required this.icon,
    required this.color,
  });

  final IconData icon;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 52,
      height: 52,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: AppColors.white,
        size: 28,
      ),
    );
  }
}