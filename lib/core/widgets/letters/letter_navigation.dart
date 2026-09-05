import 'package:flutter/material.dart';

class LetterNavigation extends StatelessWidget {
  const LetterNavigation({
    super.key,
    required this.isFirst,
    required this.isLast,
    required this.progress,
    required this.onPrevious,
    required this.onNext,
  });

  final bool isFirst;
  final bool isLast;
  final double progress;
  final VoidCallback onPrevious;
  final VoidCallback onNext;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _NavigationButton(
              icon: Icons.arrow_back_rounded,
              onTap: isFirst ? null : onPrevious,
            ),
            _NavigationButton(
              icon: Icons.arrow_forward_rounded,
              onTap: isLast ? null : onNext,
            ),
          ],
        ),
        const SizedBox(height: 14),
        ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: LinearProgressIndicator(
            value: progress,
            minHeight: 8,
            backgroundColor: Colors.black.withOpacity(.06),
          ),
        ),
      ],
    );
  }
}

class _NavigationButton extends StatelessWidget {
  const _NavigationButton({
    required this.icon,
    required this.onTap,
  });

  final IconData icon;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedOpacity(
        duration: const Duration(milliseconds: 200),
        opacity: onTap == null ? .35 : 1,
        child: Container(
          width: 54,
          height: 54,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(.06),
                blurRadius: 12,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Icon(
            icon,
            color: const Color(0xFF293657),
            size: 28,
          ),
        ),
      ),
    );
  }
}
