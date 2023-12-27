// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, override_on_non_overriding_member

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:test1/component/app_audio.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';
import 'package:test1/component/widget/build_list_tile.dart';
import 'package:test1/models/number_model.dart';


class LetterScreen extends StatefulWidget {
  const LetterScreen({Key? key}) : super(key: key);

  @override
  State<LetterScreen> createState() => _NumberScreenState();
}

class _NumberScreenState extends State<LetterScreen> {
  @override
  // void initState() {
  //   super.initState;
  //   playWelcomeSound();
  // }

  // void playWelcomeSound() async {
  //   await player.play(AssetSource(AppOudio.letterAr));
  // }

  final List<NumberModel> letter = [
    NumberModel(AppOudio.ar1, AppImages.rabbit, 'أ', 'أسد'),
    NumberModel(AppOudio.ar2, AppImages.DUCK, 'ب', 'بطة'),
    NumberModel(AppOudio.ar3, AppImages.Crown, 'ت', 'تمساح'),
    NumberModel(AppOudio.ar4, AppImages.fox, 'ث', 'ثعلب'),
    NumberModel(AppOudio.ar5, AppImages.camel, 'ج', 'جمل'),
    NumberModel(AppOudio.ar6, AppImages.b, 'ح', 'حوت'),
    NumberModel(AppOudio.ar7, AppImages.bread, 'خ', 'خروف'),
    NumberModel(AppOudio.ar8, AppImages.rooster, 'د', "ديك"),
    NumberModel(AppOudio.ar9, AppImages.wolf, 'ذ', 'ذهب'),
    NumberModel(AppOudio.ar10, AppImages.man, 'ر', "رمان"),
    NumberModel(AppOudio.ar11, AppImages.flower, 'ز', 'زرافة'),
    NumberModel(AppOudio.ar12, AppImages.hour, 'س', 'سمكة'),
    NumberModel(AppOudio.ar13, AppImages.sun, 'ش', 'شمس'),
    NumberModel(AppOudio.ar14, AppImages.Hunter, 'ص', 'صقر'),
    NumberModel(AppOudio.ar15, AppImages.officer, 'ض', 'ضفدع'),
    NumberModel(AppOudio.ar16, AppImages.child, 'ط', 'طاووس'),
    NumberModel(AppOudio.ar17, AppImages.nail, 'ظ', 'ظبي'),
    NumberModel(AppOudio.ar18, AppImages.EYE, 'ع', 'عقرب'),
    NumberModel(AppOudio.ar19, AppImages.GAR, 'غ', 'غزال'),
    NumberModel(AppOudio.ar20, AppImages.elephant, 'ف', 'فيل'),
    NumberModel(AppOudio.ar21, AppImages.moon, 'ق', 'قرد'),
    NumberModel(AppOudio.ar22, AppImages.dog, 'ك', 'كلب'),
    NumberModel(AppOudio.ar23, AppImages.meat, 'ل', 'ليمور'),
    NumberModel(AppOudio.ar24, AppImages.Mosque, 'م', 'ماعز'),
    NumberModel(AppOudio.ar25, AppImages.river, 'ن', 'نمر'),
    NumberModel(AppOudio.ar26, AppImages.pyramid, 'ه', 'هدهد'),
    NumberModel(AppOudio.ar27, AppImages.Face, 'و', 'وحيد القرن'),
    NumberModel(AppOudio.ar28, AppImages.hand, 'ي', 'يعسوب'),
  ];
  int selectedAnimalIndex = -1;
  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: colors4,
        centerTitle: true,
        title: Text('الحروف العربيه', style: Styles.textStyle25),
      ),
      body: AnimationLimiter(
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
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
                  child: Container(
                    decoration: BoxDecoration(
                      color: colors4,
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    margin: EdgeInsets.all(10),
                    child: BuildListTile(
                      subtitle: '',
                      images: letter[index].images,
                      title: '',
                      url: () async {
                        setState(() {
                          selectedAnimalIndex = index;
                        });
                        if (player.state == PlayerState.playing) {
                          await player.stop();
                        }
                        await player.play(AssetSource(letter[index].oudio!));
                      },
                      icon: selectedAnimalIndex == index
                          ? Icons.replay
                          : Icons.play_arrow,
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    player.stop();
    super.dispose();
  }
}
