import 'package:get/get.dart';

import '../../../core/services/tts_service.dart';
import '../../../data/local/learning_data.dart';
import '../../../data/models/color_model.dart';

class EnglishColorsController extends GetxController {
  final TtsService _ttsService = TtsService();

  final List<ColorModel> colors = LearningData.englishColors;

  final selectedIndex = 0.obs;

  ColorModel get selectedColor => colors[selectedIndex.value];

  @override
  void onInit() {
    super.onInit();

    _ttsService.init(language: 'en-US');
  }

  Future<void> selectColor(int index) async {
    selectedIndex.value = index;

    await _ttsService.speak(
      '${colors[index].name}, ${colors[index].example}',
      language: 'en-US',
    );
  }

  Future<void> speakColor() async {
    await _ttsService.speak(
      '${selectedColor.name}, ${selectedColor.example}',
      language: 'en-US',
    );
  }

  @override
  void onClose() {
    _ttsService.dispose();
    super.onClose();
  }
}