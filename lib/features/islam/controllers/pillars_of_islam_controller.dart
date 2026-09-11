
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import '../../../data/models/pillar_model.dart';


class PillarsOfIslamController extends GetxController {
  final FlutterTts _tts = FlutterTts();

  final RxInt speakingIndex = (-1).obs;

  
  @override
  void onInit() {
    super.onInit();

    _tts.setLanguage('ar-SA');
    _tts.setSpeechRate(0.32);
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

  Future<void> speakPillar(
    PillarModel pillar,
    int index,
  ) async {
    if (speakingIndex.value == index) {
      await stopSpeaking();
      return;
    }

    await _tts.stop();

    speakingIndex.value = index;

    final text = '${pillar.title}. ${pillar.description}';

    await _tts.speak(text);
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
