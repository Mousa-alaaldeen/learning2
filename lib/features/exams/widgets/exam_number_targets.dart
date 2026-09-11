import 'package:flutter/material.dart';

import 'exam_number_target.dart';

class ExamNumberTargets extends StatelessWidget {
  final List<Map<String, dynamic>> targets;
  final Color color;
  final void Function(
    Map<String, dynamic> item,
    Map<String, dynamic> target,
  ) onAccept;

  const ExamNumberTargets({
    super.key,
    required this.targets,
    required this.color,
    required this.onAccept,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: targets.length,
      itemBuilder: (context, index) {
        final target = targets[index];

        return Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: DragTarget<Map<String, dynamic>>(
            onWillAcceptWithDetails: (_) => true,
            onAcceptWithDetails: (details) {
              onAccept(
                details.data,
                target,
              );
            },
            builder: (
              context,
              candidateData,
              rejectedData,
            ) {
              return ExamNumberTarget(
                number: target['number'],
                isHovering: candidateData.isNotEmpty,
                color: color,
              );
            },
          ),
        );
      },
    );
  }
}