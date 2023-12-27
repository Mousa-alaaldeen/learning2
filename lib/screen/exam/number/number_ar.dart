import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:test1/component/app_audio.dart';
import 'package:test1/component/app_images.dart';
import 'package:test1/component/styles.dart';
import 'package:test1/component/widget/build_circle_avatar.dart';
import 'package:test1/component/widget/build_game_over_text.dart';
import 'package:test1/models/exam_model.dart';

import 'package:lottie/lottie.dart';


class ExamNumberAr extends StatefulWidget {
  const ExamNumberAr({Key? key}) : super(key: key);

  @override
  State<ExamNumberAr> createState() => _ExamNumberArState();
}

class _ExamNumberArState extends State<ExamNumberAr> {
  final player = AudioPlayer();
  late List<ExamModel> items, items2;
  int score = 0;
  bool gameOver = true;
  void initGame() {
    gameOver = true;
    score = 0;
    items = [
      ExamModel(AppOudio.ONE_AR, AppImages.one, '١'),
      ExamModel(AppOudio.TOW_AR, AppImages.tow, '٢'),
      ExamModel(AppOudio.THREE_AR, AppImages.three, '٣'),
      ExamModel(AppOudio.FOUR_AR, AppImages.four, '٤'),
      ExamModel(AppOudio.FIVE_AR, AppImages.five, '٥'),
      ExamModel(AppOudio.SIX_AR, AppImages.six, '٦'),
      ExamModel(AppOudio.SEVEN_AR, AppImages.seven, '٧'),
      ExamModel(AppOudio.EIGTH_AR, AppImages.eigth, '٨'),
      ExamModel(AppOudio.NINE_AR, AppImages.nine, '٩'),
      ExamModel(AppOudio.TEN_AR, AppImages.ten, '١٠'),
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
                        Navigator.pop(context);
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
                          Navigator.pop(context);
                        },
                      ),
                      BuildScore(score: score),
                      BuildGameOverText(score: score),
                      if (score == 100)
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
      padding: const EdgeInsets.all(0.0),
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