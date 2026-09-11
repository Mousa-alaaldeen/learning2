import 'package:flutter/material.dart';

import '../../../core/theme/app_colors.dart';
import 'exam_apple_items.dart';
import 'exam_number_targets.dart';

class ExamGameBoard extends StatelessWidget {
  final List<Map<String, dynamic>> items;
  final List<Map<String, dynamic>> targets;
  final Color color;
  final void Function(
    Map<String, dynamic> item,
    Map<String, dynamic> target,
  ) onAccept;

  const ExamGameBoard({
    super.key,
    required this.items,
    required this.targets,
    required this.color,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: ExamAppleItems(
            items: items,
            color: color,
          ),
        ),
        Container(
          width: 2,
          height: double.infinity,
          margin: const EdgeInsets.symmetric(
            vertical: 20,
          ),
          color: color.withOpacity(.15),
        ),
        Expanded(
          child: ExamNumberTargets(
            targets: targets,
            color: color,
            onAccept: onAccept,
          ),
        ),
      ],
    );
  }
}