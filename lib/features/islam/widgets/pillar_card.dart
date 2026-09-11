import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../data/models/pillar_model.dart';

class PillarCard extends StatelessWidget {
  const PillarCard({
    super.key,
    required this.pillar,
    required this.index,
    required this.isSpeaking,
    required this.onSpeak,
  });

  final PillarModel pillar;
  final int index;
  final bool isSpeaking;
  final VoidCallback onSpeak;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 350),
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isSpeaking ? pillar.color.withOpacity(.10) : Colors.white,
        borderRadius: BorderRadius.circular(28),
        border: Border.all(
          color:
              isSpeaking ? pillar.color.withOpacity(.45) : Colors.transparent,
          width: 2,
        ),
        boxShadow: [
          BoxShadow(
            color: pillar.color.withOpacity(
              isSpeaking ? .28 : .14,
            ),
            blurRadius: isSpeaking ? 24 : 16,
            spreadRadius: isSpeaking ? 2 : 0,
            offset: const Offset(0, 7),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            children: [
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: 62,
                height: 62,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      pillar.color,
                      Color.lerp(
                        pillar.color,
                        Colors.black,
                        .15,
                      )!,
                    ],
                  ),
                  shape: BoxShape.circle,
                ),
                child: Center(
                  child: Text(
                    pillar.emoji,
                    style: const TextStyle(fontSize: 31),
                  ),
                ),
              ),
              const SizedBox(width: 14),
              Expanded(
                child: Text(
                  pillar.title,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                    fontFamily: 'Amiri',
                    fontSize: 23,
                    fontWeight: FontWeight.w900,
                    color: Color(0xFF293657),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              GestureDetector(
                onTap: onSpeak,
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: 52,
                  height: 52,
                  decoration: BoxDecoration(
                    color: isSpeaking
                        ? pillar.color
                        : pillar.color.withOpacity(.12),
                    borderRadius: BorderRadius.circular(17),
                  ),
                  child: Icon(
                    isSpeaking ? Icons.stop_rounded : Icons.volume_up_rounded,
                    color: isSpeaking ? Colors.white : pillar.color,
                    size: 28,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 14),
          AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            decoration: BoxDecoration(
              color: isSpeaking ? Colors.white : pillar.color.withOpacity(.06),
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              pillar.description,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Amiri',
                fontSize: 20,
                height: 1.7,
                fontWeight: FontWeight.bold,
                color: isSpeaking ? pillar.color : const Color(0xFF59657F),
              ),
            ),
          ),
          if (isSpeaking) ...[
            const SizedBox(height: 10),
            Text(
              'استمع واقرأ معي 🔊',
              style: TextStyle(
                fontFamily: 'Amiri',
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: pillar.color,
              ),
            ),
          ],
        ],
      ),
    )
        .animate()
        .fadeIn(
          delay: (index * 100).ms,
          duration: 450.ms,
        )
        .slideY(
          begin: .12,
          end: 0,
          delay: (index * 100).ms,
          duration: 500.ms,
        );
  }
}
