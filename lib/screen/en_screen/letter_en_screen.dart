// ignore_for_file: prefer_const_constructors

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/widget/build_appbar.dart';
import 'package:test1/component/widget/build_list_tile.dart';
import 'package:test1/models/models.dart';

class LetterEnScreen extends StatefulWidget {
  const LetterEnScreen({Key? key}) : super(key: key);

  @override
  State<LetterEnScreen> createState() => _LetterEnScreenState();
}

class _LetterEnScreenState extends State<LetterEnScreen> {
  final player = AudioPlayer();

  int selectedAnimalIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'الحروف الانجليزيه', color: colors1),
      body: buildAnimationList(),
    );
  }

  AnimationLimiter buildAnimationList() {
    return AnimationLimiter(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(
          parent: AlwaysScrollableScrollPhysics(),
        ),
        itemCount: letter.length,
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
        color: colors1,
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: EdgeInsets.all(10),
      child: BuildListTile(
        icon: selectedAnimalIndex == index ? Icons.replay : Icons.play_arrow,
        subtitle: '',
        images: letter[index].images,
        title: letter[index].title,
        url: () async {
          setState(() {
            selectedAnimalIndex = index;
          });
          if (player.state == PlayerState.playing) {
            await player.stop();
          }
          await player.play(
            AssetSource(letter[index].oudio!),
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
