import 'package:flutter/material.dart';

import 'exam_apple_card.dart';

class ExamAppleItems extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final Color color;

  const ExamAppleItems({
    super.key,
    required this.items,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: Draggable<Map<String, dynamic>>(
            data: item,
            feedback: Material(
              color: Colors.transparent,
              child: SizedBox(
                width: 160,
                child: ExamAppleCard(
                  item: item,
                  dragging: true,
                  color: color,
                ),
              ),
            ),
            childWhenDragging: Opacity(
              opacity: .25,
              child: ExamAppleCard(
                item: item,
                color: color,
              ),
            ),
            child: ExamAppleCard(
              item: item,
              color: color,
            ),
          ),
        );
      },
    );
  }
}