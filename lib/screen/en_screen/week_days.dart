import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:test1/component/app_audio.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/widget/build_appbar.dart';

class WeekDaysScreen extends StatefulWidget {
  const WeekDaysScreen({Key? key}) : super(key: key);

  @override
  State<WeekDaysScreen> createState() => _WeekDaysScreenState();
}

class _WeekDaysScreenState extends State<WeekDaysScreen> {
  final player = AudioPlayer();
  bool isPlayer = false;
  // @override
  // void initState() {
  //   super.initState;
  //   playWelcomeSound();
  // }

  void playWelcomeSound() async {
    await player.play(AssetSource(AppOudio.weekDays));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'ايام الاسبوع', color: colors3),
      body: Column(
        children: [
          Expanded(
            child: Image.asset(
              AppImages.WeekDays,
              fit: BoxFit.fill,
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              InkWell(
                onTap: () async {
                  if (player.state == PlayerState.playing) {
                    await player.stop();
                  } else {
                    await player.play(AssetSource(AppOudio.weekDays));
                  }
                  setState(() {
                    isPlayer = player.state == PlayerState.playing;
                  });
                },
                child: CircleAvatar(
                  backgroundColor: colors3,
                  radius: 40,
                  child: isPlayer
                      ? const Icon(Icons.pause)
                      : const Icon(
                          Icons.play_arrow,
                        ),
                ),
              ),
              const SizedBox(
                height: 100,
              )
            ],
          ),
        ],
      ),
      // bottomNavigationBar: const AdBannerModels(),
    );
  }

  @override
  void deactivate() {
    player.stop();
    super.deactivate();
  }
}
