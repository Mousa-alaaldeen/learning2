import 'package:flutter/material.dart';

class GameDecorationIcon extends StatelessWidget {
  const GameDecorationIcon({
    super.key,
    required this.icon,
    this.size = 30,
    this.opacity = .20,
    this.color = Colors.white,
  });

  final IconData icon;
  final double size;
  final double opacity;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      size: size,
      color: color.withOpacity(opacity),
    );
  }
}
