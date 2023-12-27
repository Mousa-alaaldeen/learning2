import 'package:flutter/material.dart';

import 'package:progress_bar_steppers/steppers.dart';
import 'package:test1/component/styles.dart';

class BuildSteppersScreen extends StatelessWidget {
  const BuildSteppersScreen({
    Key? key,
    required this.stepsData,
    required this.currentStep,
  }) : super(key: key);

  final List<StepperData> stepsData;
  final int currentStep;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Steppers(
              direction: StepperDirection.horizontal,
              labels: stepsData,
              currentStep: currentStep,
              stepBarStyle: StepperStyle(
                maxLineLabel: 1,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 40,
            ),
          ),
          const SliverToBoxAdapter(
            child: Center(
              child: Text('الاختبارات', style: Styles.textStyle25),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
          SliverToBoxAdapter(
            child: Steppers(
              direction: StepperDirection.vertical,
              labels: stepsData,
              currentStep: currentStep,
              stepBarStyle: StepperStyle(
                maxLineLabel: 2,
              ),
            ),
          ),
          const SliverToBoxAdapter(
            child: SizedBox(
              height: 16,
            ),
          ),
        ],
      ),
    );
  }
}
