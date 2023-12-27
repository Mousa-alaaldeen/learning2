import 'package:flutter/material.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';
import 'package:test1/component/widget/vedio_screen.dart';
class AzanScreen extends StatelessWidget {
  const AzanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'الاذان و دعاء الاذان',
          style: Styles.textStyle25,
        ),
        backgroundColor: colors4,
        centerTitle: true,
      ),
      body: const VedioScreen(
        url: "assets/video/azan.mp4",
        text: AppImages.azan,
      ),
    );
  }
}
