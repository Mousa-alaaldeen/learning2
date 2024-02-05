import 'package:flutter/material.dart';

import 'package:progress_bar_steppers/steppers.dart';
import 'package:test1/component/widget/ad.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';
import 'package:test1/component/widget/build_steppers_screen.dart';
import 'package:test1/screen/exam/letter/letter_en/screen_three.dart';
import 'package:test1/screen/exam/letter/letter_en/screen_two.dart';
import 'package:test1/screen/exam/letter/letter_en/secreen_one.dart';

class ExamLetterEn extends StatefulWidget {
  const ExamLetterEn({Key? key}) : super(key: key);

  @override
  State<ExamLetterEn> createState() => _ExamLetterEnState();
}

class _ExamLetterEnState extends State<ExamLetterEn> {
  var id = idEn;
  var currentStep = idEn + 1;
  var totalSteps = 0;

  late List<StepperData> stepsData;

  @override
  void initState() {
    super.initState();

    stepsData = [
      StepperData(
        label: 'الاختبار 1',
        description: '',
        child: id >= 0
            ? Column(
                children: [
                  Image.asset(
                    AppImages.letterEn10,
                    height: 200,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'الدخول الى الاختبار',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenOneEn(),
                          ));
                    },
                  ),
                ],
              )
            : Image.asset(
                AppImages.letterEn10,
                height: 200,
              ),
      ),
      StepperData(
        label: 'الاختبار 2',
        description: '',
        child: id >= 1
            ? Column(
                children: [
                  Image.asset(
                    AppImages.letterEn20,
                    height: 200,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'الدخول الى الاختبار',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenTwoEn(),
                          ));
                    },
                  ),
                ],
              )
            : Image.asset(
                AppImages.letterEn20,
                height: 200,
              ),
      ),
      StepperData(
        label: 'الاختبار 3',
        description: '',
        child: id >= 2
            ? Column(
                children: [
                  Image.asset(
                    AppImages.letterEn30,
                    height: 200,
                  ),
                  ElevatedButton(
                    child: const Text(
                      'الدخول الى الاختبار',
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontFamily: 'Amiri',
                      ),
                    ),
                    onPressed: () {
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScreenThreeEn(),
                          ));
                    },
                  ),
                ],
              )
            : Image.asset(
                AppImages.letterEn30,
                height: 200,
              ),
      ),
    ];
    totalSteps = stepsData.length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title:
            const Text('اختبارات الحروف الانجليزيه', style: Styles.textStyle25),
        centerTitle: true,
      ),
      body: BuildSteppersScreen(stepsData: stepsData, currentStep: currentStep),
    );
  }
}
