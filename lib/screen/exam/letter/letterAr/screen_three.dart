// ignore_for_file: avoid_print, unused_import
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:test1/component/app_audio.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/cache_helper.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';
import 'package:test1/component/widget/build_game_over_text.dart';
import 'package:test1/models/exam_model.dart';
import 'package:test1/screen/exam/letter/letterAr/layout_screen.dart';
import '../../../../component/widget/build_circle_avatar.dart';

class ScreenThreeAr extends StatefulWidget {
  const ScreenThreeAr({Key? key}) : super(key: key);

  @override
  State<ScreenThreeAr> createState() => _ScreenThreeArState();
}

class _ScreenThreeArState extends State<ScreenThreeAr> {
  final player = AudioPlayer();
  late List<ExamModel> items, items2;
  int score = 0;

  bool gameOver = true;
  void initGame() {
    gameOver = true;
    score = 0;
    items = [
      ExamModel(AppOudio.ar21, AppImages.moon, 'ق'),
      ExamModel(AppOudio.ar22, AppImages.dog, 'ك'),
      ExamModel(AppOudio.ar23, AppImages.meat, 'ل'),
      ExamModel(AppOudio.ar24, AppImages.Mosque, 'م'),
      ExamModel(AppOudio.ar25, AppImages.river, 'ن'),
      ExamModel(AppOudio.ar26, AppImages.pyramid, 'ه'),
      ExamModel(AppOudio.ar27, AppImages.Face, 'و'),
      ExamModel(AppOudio.ar28, AppImages.hand, 'ي'),
    ];
    items2 = List<ExamModel>.from(items)..shuffle();
    items.shuffle();

    if (items.isEmpty) {
      gameOver = true;
    }
  }

  @override
  void initState() {
    super.initState();
    initGame();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              if (gameOver) ...[
                Column(
                  children: [
                    BuildCircleAvatar(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ExamLetterAr(),
                            ));
                      },
                    ),
                    BuildScore(score: score),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 2,
                          height: MediaQuery.of(context).size.height,
                          child: GridView(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1),
                            children: items.map((item) {
                              return Container(
                                margin: const EdgeInsets.all(20),
                                child: Draggable(
                                  data: item,
                                  childWhenDragging: Container(
                                    height: 190,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.withOpacity(0.3),
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(item.img),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  feedback: Container(
                                    height: 200,
                                    width: 200,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(item.img),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                  child: Container(
                                    height: 150,
                                    width:
                                        MediaQuery.of(context).size.width / 3,
                                    decoration: BoxDecoration(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .secondary,
                                      borderRadius: BorderRadius.circular(10),
                                      image: DecorationImage(
                                          image: AssetImage(item.img),
                                          fit: BoxFit.fill),
                                    ),
                                  ),
                                ),
                              );
                            }).toList(),
                          ),
                        ),
                        if (items.isNotEmpty)
                          Padding(
                            padding: const EdgeInsets.only(top: 40),
                            child: Lottie.asset(
                              'assets/animation_json/arroe.json',
                              fit: BoxFit.cover,
                              width: MediaQuery.of(context).size.width / 7,
                            ),
                          ),
                        const Spacer(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 4,
                          height: MediaQuery.of(context).size.height,
                          child: GridView(
                            shrinkWrap: true,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 1),
                            children: items2.map((item) {
                              return DragTarget(
                                builder:
                                    (context, candidateData, rejectedData) =>
                                        Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Container(
                                    margin: const EdgeInsets.only(
                                        bottom: 12, left: 8),
                                    height:
                                        MediaQuery.of(context).size.width / 3,
                                    width: 100,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: item.accepting
                                          ? Colors.grey[200]
                                          : Theme.of(context)
                                              .colorScheme
                                              .primaryContainer,
                                    ),
                                    child: Center(
                                      child: Text(
                                        item.value,
                                        style: Styles.textStyle25,
                                      ),
                                    ),
                                  ),
                                ),
                                onAccept: (ExamModel receivedItem) {
                                  if (item.value == receivedItem.value) {
                                    setState(() {
                                      items.remove(receivedItem);
                                      items2.remove(item);
                                    });
                                    score += 10;
                                    player.play(AssetSource(AppOudio.trueExam));
                                    item.accepting = false;
                                  } else {
                                    setState(() {
                                      score -= 5;
                                      item.accepting = false;
                                      player.play(
                                          AssetSource(AppOudio.falseExame));
                                    });
                                  }
                                },
                                onWillAccept: (data) {
                                  setState(() => item.accepting = true);
                                  return true;
                                },
                                onLeave: (data) {
                                  setState(() => item.accepting = false);
                                },
                              );
                            }).toList(),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                if (items.isEmpty) ...[
                  Column(
                    children: [
                      BuildCircleAvatar(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ExamLetterAr(),
                              ));
                        },
                      ),
                      BuildScore(score: score),
                      BuildGameOverText(score: score),
                      if (score == 80)
                        Lottie.asset(
                          AppImages.fireworks,
                          height: MediaQuery.of(context).size.height * .4,
                          fit: BoxFit.cover,
                        ),
                      Container(
                        height: MediaQuery.of(context).size.width / 5,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextButton(
                          child: const Text(
                            'دخول للاختبار مرة أخرى',
                            style: Styles.textStyle20,
                          ),
                          onPressed: () {
                            setState(initGame);
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ],
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    if (score == 100 && idAr == 2) {
      idAr++;
      CacheHelper.saveData(key: 'idAr', value: idAr);
      print(idAr);
      print("iiiiiiiiiiiiiiiiiiiddddddddddddd");
    }
    super.dispose();
  }
}

class BuildScore extends StatelessWidget {
  const BuildScore({
    Key? key,
    required this.score,
  }) : super(key: key);

  final int score;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Text.rich(TextSpan(children: [
        const TextSpan(
          text: 'النتيجه',
          style: Styles.textStyle25,
        ),
        TextSpan(
            text: ' : $score ',
            style: Theme.of(context)
                .textTheme
                .displayMedium!
                .copyWith(color: Theme.of(context).colorScheme.primary))
      ])),
    );
  }
}
