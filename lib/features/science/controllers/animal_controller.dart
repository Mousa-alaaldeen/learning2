import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

import '../../../data/local/learning_data.dart';

class AnimalController extends GetxController {
  final AudioPlayer player = AudioPlayer();

  final selectedAnimalIndex = 0.obs;

  void selectAnimal(int index) async {
    selectedAnimalIndex.value = index;

    if (player.state == PlayerState.playing) {
      await player.stop();
    }

    await player.play(
      AssetSource(LearningData.animalsList[index].soundPath),
    );
  }

  @override
  void onClose() {
    player.stop();
    player.dispose();
    super.onClose();
  }
}
