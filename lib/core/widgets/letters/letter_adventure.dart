import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LetterAdventure extends StatelessWidget {
  const LetterAdventure({
    super.key,
    required this.letter,
    required this.color,
  });

  final dynamic letter;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            color,
            Color.lerp(
              color,
              Colors.black,
              .12,
            )!,
          ],
        ),
        borderRadius: BorderRadius.circular(32),
        boxShadow: [
          BoxShadow(
            color: color.withOpacity(.25),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            top: -10,
            right: 5,
            child: Icon(
              Icons.star_rounded,
              size: 35,
              color: Colors.white.withOpacity(.25),
            ),
          ),
          Positioned(
            bottom: 5,
            left: 10,
            child: Icon(
              Icons.auto_awesome_rounded,
              size: 28,
              color: Colors.white.withOpacity(.25),
            ),
          ),
          Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 105,
                  height: 105,
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.18),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white.withOpacity(.35),
                      width: 2,
                    ),
                  ),
                  child: Center(
                    child: FaIcon(
                      letter.icon,
                      color: Colors.white,
                      size: 45,
                    ),
                  ),
                ).animate().scale(
                      begin: const Offset(.7, .7),
                      end: const Offset(1, 1),
                      duration: 600.ms,
                      curve: Curves.easeOutBack,
                    ),
                const SizedBox(height: 12),
                Text(
                  letter.letter,
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 72,
                    fontWeight: FontWeight.w900,
                    color: Colors.white,
                    height: 1,
                  ),
                ).animate().fadeIn(duration: 400.ms).slideY(
                      begin: -.2,
                      end: 0,
                      duration: 500.ms,
                    ),
                const SizedBox(height: 8),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 7,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(.18),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    letter.word,
                    style: const TextStyle(
                      fontFamily: 'Amiri',
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
