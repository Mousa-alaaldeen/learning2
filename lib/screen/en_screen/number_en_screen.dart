// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/widget/build_appbar.dart';
import 'package:test1/component/widget/build_list_tile.dart';
import 'package:test1/models/models.dart';

class NumberEnScreen extends StatefulWidget {
  const NumberEnScreen({Key? key}) : super(key: key);

  @override
  State<NumberEnScreen> createState() => _NumberEnScreenState();
}

class _NumberEnScreenState extends State<NumberEnScreen> {
  final player = AudioPlayer();
  int selectedAnimalIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'الأرقام الإنجليزيه', color: colors4),
      body: buildAnimationList(),
    );
  }

  AnimationLimiter buildAnimationList() {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: numbers.length,
        itemBuilder: (BuildContext c, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            delay: const Duration(milliseconds: 100),
            child: SlideAnimation(
              duration: const Duration(milliseconds: 2500),
              curve: Curves.fastLinearToSlowEaseIn,
              horizontalOffset: 30,
              verticalOffset: 300.0,
              child: FlipAnimation(
                duration: const Duration(milliseconds: 3000),
                curve: Curves.fastLinearToSlowEaseIn,
                flipAxis: FlipAxis.y,
                child: buildLetterContainer(index),
              ),
            ),
          );
        },
      ),
    );
  }

  Container buildLetterContainer(int index) {
    return Container(
      decoration: BoxDecoration(
        color: colors4,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.all(10),
      child: BuildListTile(
        icon: selectedAnimalIndex == index ? Icons.replay : Icons.play_arrow,
        subtitle: '',
        images: numbers[index].images,
        title: numbers[index].title,
        url: () async {
          setState(() {
            selectedAnimalIndex = index;
          });
          if (player.state == PlayerState.playing) {
            await player.stop();
          }
          await player.play(
            AssetSource(numbers[index].oudio!),
          );
        },
      ),
    );
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }
}
