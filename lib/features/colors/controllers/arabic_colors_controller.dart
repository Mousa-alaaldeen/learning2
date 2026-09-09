import 'package:get/get.dart';

import '../../../core/services/tts_service.dart';
import '../../../data/local/learning_data.dart';
import '../../../data/models/color_model.dart';

class ArabicColorsController extends GetxController {
  final TtsService _ttsService = TtsService();

  final List<ColorModel> colors = LearningData.arabicColors;

  final selectedIndex = 0.obs;

  ColorModel get selectedColor => colors[selectedIndex.value];

  @override
  void onInit() {
    super.onInit();

    _ttsService.init(language: 'ar-SA');
  }

  Future<void> selectColor(int index) async {
    selectedIndex.value = index;

    await _ttsService.speak(
      '${colors[index].name}، مثل ${colors[index].example}',
      language: 'ar-SA',
    );
  }

  Future<void> speakColor() async {
    await _ttsService.speak(
      '${selectedColor.name}، مثل ${selectedColor.example}',
      language: 'ar-SA',
    );
  }

  @override
  void onClose() {
    _ttsService.dispose();
    super.onClose();
  }
}
