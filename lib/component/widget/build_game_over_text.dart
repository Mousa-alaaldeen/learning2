import 'package:flutter/material.dart';
import 'package:test1/component/styles.dart';

class BuildGameOverText extends StatelessWidget {
  const BuildGameOverText({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'انتها الاختبار',
                style: Styles.textStyle20.copyWith(color: Colors.red),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(0),
              child: Text(
                score == 100 ? 'رائع' : 'قدم الامتحان مرة أخرى',
                style: Styles.textStyle20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
