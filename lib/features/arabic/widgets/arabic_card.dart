import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

class ArabicCard extends StatelessWidget {
  const ArabicCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.color,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final IconData icon;
  final Color color;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(30),
          boxShadow: [
            BoxShadow(
              color: color.withOpacity(.18),
              blurRadius: 18,
              offset: const Offset(0, 8),
            ),
          ],
        ),
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            // Decoration
            Positioned(
              top: -20,
              right: -20,
              child: Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: color.withOpacity(.10),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Positioned(
              bottom: -25,
              left: -25,
              child: Container(
                width: 85,
                height: 85,
                decoration: BoxDecoration(
                  color: color.withOpacity(.07),
                  shape: BoxShape.circle,
                ),
              ),
            ),

            // Content
            Positioned.fill(
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: FittedBox(
                  fit: BoxFit.scaleDown,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Icon
                      Container(
                        width: 72,
                        height: 72,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [
                              color,
                              Color.lerp(
                                color,
                                Colors.black,
                                .15,
                              )!,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: color.withOpacity(.30),
                              blurRadius: 14,
                              spreadRadius: 2,
                              offset: const Offset(0, 5),
                            ),
                          ],
                        ),
                        child: Icon(
                          icon,
                          color: Colors.white,
                          size: 38,
                        ),
                      )
                          .animate(
                            onPlay: (controller) {
                              controller.repeat(reverse: true);
                            },
                          )
                          .moveY(
                            begin: -3,
                            end: 3,
                            duration: 1100.ms,
                            curve: Curves.easeInOut,
                          ),

                      const SizedBox(height: 10),

                      // Title
                      Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 19,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF293657),
                        ),
                      ),

                      const SizedBox(height: 2),

                      // Subtitle
                      Text(
                        subtitle,
                        textAlign: TextAlign.center,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          fontFamily: 'Amiri',
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF8A94AD),
                        ),
                      ),

                      const SizedBox(height: 8),

                      // Start button
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 14,
                          vertical: 5,
                        ),
                        decoration: BoxDecoration(
                          color: color.withOpacity(.12),
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Icon(
                              Icons.play_arrow_rounded,
                              color: color,
                              size: 19,
                            ),
                            const SizedBox(width: 2),
                            Text(
                              'ابدأ',
                              style: TextStyle(
                                fontFamily: 'Amiri',
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: color,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      )
          .animate()
          .fadeIn(duration: 450.ms)
          .scale(
            begin: const Offset(.92, .92),
            end: const Offset(1, 1),
            duration: 500.ms,
            curve: Curves.easeOutBack,
          ),
    );
  }
}
