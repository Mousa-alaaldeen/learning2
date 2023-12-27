import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:test1/component/app_audio.dart';
import 'package:test1/screen/welcome_screen/img.dart';
import 'package:test1/screen/welcome_screen/my_icon.dart';
import 'package:test1/screen/welcome_screen/text_one.dart';
import 'package:test1/screen/welcome_screen/text_two.dart';

class WelcomScreen extends StatefulWidget {
  const WelcomScreen({Key? key}) : super(key: key);

  @override
  State<WelcomScreen> createState() => _WelcomScreenState();
}

class _WelcomScreenState extends State<WelcomScreen> {
  final player = AudioPlayer();

  @override
  void initState() {
    super.initState;
    playWelcomeSound();
  }

  void playWelcomeSound() async {
    await player.play(AssetSource(AppOudio.Welcome));
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          const Img(),
          const TextOne(),
          const TextTwo(),
          MyIcon(width: width),
        ],
      ),
    ));
  }
}
