import 'package:flutter/material.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';
import 'package:test1/component/widget/vedio_screen.dart';

class TashahhudScreen extends StatelessWidget {
  const TashahhudScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "التشهد و الصلاة الابراهميه",
          style: Styles.textStyle25,
        ),
        backgroundColor: colors1,
        centerTitle: true,
      ),
      body: const VedioScreen(
        url: "assets/video/at_tashahhud.mp4",
        text: AppImages.tashahhud,
      ),
    );
  }
}
