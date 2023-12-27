import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:test1/component/app_audio.dart';
import 'package:test1/component/components.dart';
import 'package:test1/component/styles.dart';
import 'package:test1/component/widget/build_appbar.dart';
import 'package:test1/models/animal_model.dart';
import 'package:test1/models/models.dart';

class AnimalScreen extends StatefulWidget {
  const AnimalScreen({Key? key}) : super(key: key);

  @override
  State<AnimalScreen> createState() => _AnimalScreenState();
}

class _AnimalScreenState extends State<AnimalScreen> {
  @override
  void initState() {
    super.initState;
    playWelcomeSound();
  }

  void playWelcomeSound() async {
    await player.play(AssetSource(AppOudio.bird_oudio));
  }

  int selectedAnimalIndex = 0;

  final player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'أصوات الحيوانات', color: colors5),
      body: Column(
        children: [
          AnimalImage(
              animalsList: animalsList,
              selectedAnimalIndex: selectedAnimalIndex),
          const SizedBox(
            height: 10,
          ),
          itemAnimals(),
        ],
      ),
    );
  }

  Expanded itemAnimals() {
    return Expanded(
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: animalsList.length, // عدد الحيوانات في القائمة
        itemBuilder: (context, index) {
          final animal = animalsList[index];
          return GestureDetector(
            onTap: () async {
              setState(() {
                selectedAnimalIndex = index;
              });
              if (player.state == PlayerState.playing) {
                await player.stop();
              }
              await player.play(AssetSource(animalsList[index].soundPath));
            },
            child: Card(
              color: selectedAnimalIndex == index ? colors5 : Colors.white,
              child: Column(
                children: [
                  Expanded(child: Image.asset(animal.imagePath)),
                  Text(
                    animal.name,
                    style: Styles.textStyle20,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: selectedAnimalIndex == index
                        ? const Icon(Icons.volume_up_outlined)
                        : Icon(
                            Icons.abc_outlined,
                            color: Colors.grey.shade100,
                          ),
                  ),
                ],
              ),
            ),
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

class AnimalImage extends StatelessWidget {
  const AnimalImage({
    Key? key,
    required this.animalsList,
    required this.selectedAnimalIndex,
  }) : super(key: key);

  final List<AnimalModel> animalsList;
  final int selectedAnimalIndex;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      animalsList[selectedAnimalIndex].imagePath,
      height: MediaQuery.of(context).size.height * .3,
      width: MediaQuery.of(context).size.width,
      fit: BoxFit.fill,
    );
  }
}
