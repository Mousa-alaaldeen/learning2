import 'package:flutter/material.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';
import 'package:test1/component/widget/vedio_screen.dart';


class AblutionScreen extends StatelessWidget {
  const AblutionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'تعلم الوضوء',
          style: Styles.textStyle25,
        ),
        backgroundColor: colors2,
        centerTitle: true,
      ),
      body: const VedioScreen(
        url: "assets/video/Ablution.mp4",
        text: AppImages.Ablution,
      ),
    );
  }
}
