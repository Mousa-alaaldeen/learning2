
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

import '../../../data/local/learning_data.dart';

class TashahhudController extends GetxController {
  final FlutterTts _tts = FlutterTts();

  final RxInt speakingIndex = (-1).obs;

 
  @override
  void onInit() {
    super.onInit();

    _tts.setLanguage('ar-SA');
    _tts.setSpeechRate(0.30);
    _tts.setPitch(1.0);
    _tts.setVolume(1.0);

    _tts.setCompletionHandler(() {
      speakingIndex.value = -1;
    });

    _tts.setCancelHandler(() {
      speakingIndex.value = -1;
    });

    _tts.setErrorHandler((message) {
      speakingIndex.value = -1;
    });
  }

  Future<void> speakPart(int index) async {
    if (speakingIndex.value == index) {
      await stopSpeaking();
      return;
    }

    await _tts.stop();

    speakingIndex.value = index;

    await _tts.speak(LearningData.tashahhud[index]['description']!);
  }

  Future<void> speakCurrent() async {
    await speakPart(0);
  }

  Future<void> stopSpeaking() async {
    await _tts.stop();
    speakingIndex.value = -1;
  }

  @override
  void onClose() {
    _tts.stop();
    super.onClose();
  }
}
