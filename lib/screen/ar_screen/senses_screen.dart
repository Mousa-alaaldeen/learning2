import 'package:flutter/material.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';
import 'package:test1/component/widget/vedio_screen.dart';

class SensesScreen extends StatelessWidget {
  const SensesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "الحواس الخمس",
          style: Styles.textStyle25,
        ),
        backgroundColor: colors4,
        centerTitle: true,
      ),
      body: const VedioScreen(
        url: "assets/video/senses.mp4",
        text: AppImages.senses,
      ),
    );
  }
}
