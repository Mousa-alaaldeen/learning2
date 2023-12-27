import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/screen/exam/letter/letterAr/layout_screen.dart';

import 'package:test1/screen/exam/letter/letter_en/layout_screen.dart';
import 'package:test1/screen/exam/number/number_ar.dart';
import 'package:test1/screen/exam/number/number_en.dart';

final List<Widget> examScreen = [
  const ExamNumberAr(),
  const ExamNumberEn(),
  const ExamLetterAr(),
  const ExamLetterEn(),
];

final List imageAndTextExam = [
  AppImages.examNumberAr,
  AppImages.examNumberEn,
  AppImages.letterAr,
  AppImages.letterEn,
];
List<Widget> buildGridItems(context) {
  return List.generate(examScreen.length, (int index) {
    return AnimationConfiguration.staggeredGrid(
      position: index,
      duration: const Duration(milliseconds: 500),
      columnCount: 2,
      child: ScaleAnimation(
        duration: const Duration(milliseconds: 900),
        curve: Curves.ease,
        child: FadeInAnimation(
          child: buildGridItem(index, context),
        ),
      ),
    );
  });
}

Widget buildGridItem(int index, context) {
  double w = MediaQuery.of(context).size.width;
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => examScreen[index],
        ),
      );
    },
    child: Container(
      margin: EdgeInsets.only(bottom: w / 30, left: w / 60, right: w / 60),
      height: 300,
      child: Image.asset(
        imageAndTextExam[index],
        width: MediaQuery.of(context).size.width,
        fit: BoxFit.fill,
      ),
    ),
  );
}
