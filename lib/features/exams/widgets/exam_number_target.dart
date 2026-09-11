import 'package:flutter/material.dart';

class ExamNumberTarget extends StatelessWidget {
  final String number;
  final bool isHovering;
  final Color color;

  const ExamNumberTarget({
    super.key,
    required this.number,
    required this.isHovering,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 180),
      height: 90,
      decoration: BoxDecoration(
        color: isHovering
            ? color.withOpacity(.18)
            : Colors.white,
        borderRadius: BorderRadius.circular(22),
        border: Border.all(
          color: color.withOpacity(
            isHovering ? .8 : .2,
          ),
          width: isHovering ? 3 : 1.5,
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 10,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Center(
        child: Text(
          number,
          style: const TextStyle(
            fontSize: 38,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
    );
  }
}