import 'package:flutter/material.dart';

class LetterInfo extends StatelessWidget {
  const LetterInfo({
    super.key,
    required this.letter,
    required this.onSpeak,
    required this.color,
  });

  final dynamic letter;
  final VoidCallback onSpeak;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(28),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.06),
            blurRadius: 15,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 52,
            height: 52,
            decoration: BoxDecoration(
              color: color.withOpacity(.12),
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.lightbulb_rounded,
              color: color,
              size: 28,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'الحرف والمثال',
                  style: TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF8A94AD),
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  '${letter.letter} — ${letter.word}',
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 22,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF293657),
                  ),
                ),
              ],
            ),
          ),
          GestureDetector(
            onTap: onSpeak,
            child: Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: color.withOpacity(.12),
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.volume_up_rounded,
                color: color,
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
