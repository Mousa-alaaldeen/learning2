import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_confetti_engine/flutter_confetti_engine.dart';
import 'package:get/get.dart';

import '../../../component/app_audio.dart';
import '../../../data/models/sense_item.dart';
import '../../../data/models/sense_option.dart';

class EnglishSensesController extends GetxController {
  final FlutterTts _tts = FlutterTts();
  final AudioPlayer _animalPlayer = AudioPlayer();

  final currentIndex = 0.obs;
  final totalStars = 0.obs;
  final isSpeaking = false.obs;
  final highlightedOptionIndex = (-1).obs;
  final isTeaching = true.obs;

  bool _isClosed = false;
  bool _ttsReady = false;

  final List<SenseItem> senses = const [
    SenseItem(
      name: 'Sight',
      description: 'We use our eyes to see',
      emoji: '👁️',
      color: Color(0xFF35A9F0),
    ),
    SenseItem(
      name: 'Hearing',
      description: 'We use our ears to hear',
      emoji: '👂',
      color: Color(0xFFFFB52E),
    ),
    SenseItem(
      name: 'Smell',
      description: 'We use our nose to smell',
      emoji: '👃',
      color: Color(0xFF63C83F),
    ),
    SenseItem(
      name: 'Taste',
      description: 'We use our tongue to taste',
      emoji: '👅',
      color: Color(0xFFF34F82),
    ),
    SenseItem(
      name: 'Touch',
      description: 'We use our hands to feel',
      emoji: '🖐️',
      color: Color(0xFF8759E8),
    ),
  ];

  final List<List<SenseOption>> options = const [
    [
      SenseOption(
        name: 'Apple',
        emoji: '🍎',
        color: Color(0xFFE84C4C),
      ),
      SenseOption(
        name: 'Ball',
        emoji: '⚽',
        color: Color(0xFF4D8FE8),
      ),
      SenseOption(
        name: 'Sun',
        emoji: '☀️',
        color: Color(0xFF54BFEA),
      ),
    ],
    [
      SenseOption(
        name: 'Cat',
        emoji: '🐱',
        color: Color(0xFF8E70E8),
      ),
      SenseOption(
        name: 'Dog',
        emoji: '🐶',
        color: Color(0xFFE79B45),
      ),
      SenseOption(
        name: 'Cow',
        emoji: '🐄',
        color: Color(0xFF63B77A),
      ),
    ],
    [
      SenseOption(
        name: 'Rose',
        emoji: '🌹',
        color: Color(0xFFE85B8A),
      ),
      SenseOption(
        name: 'Lemon',
        emoji: '🍋',
        color: Color(0xFFE6C62F),
      ),
      SenseOption(
        name: 'Soap',
        emoji: '🧼',
        color: Color(0xFF54BFEA),
      ),
    ],
    [
      SenseOption(
        name: 'Lemon',
        emoji: '🍋',
        color: Color(0xFFE7C83C),
      ),
      SenseOption(
        name: 'Honey',
        emoji: '🍯',
        color: Color(0xFFE99B27),
      ),
      SenseOption(
        name: 'Soap',
        emoji: '🧼',
        color: Color(0xFF54BFEA),
      ),
    ],
    [
      SenseOption(
        name: 'Ice',
        emoji: '❄️',
        color: Color(0xFF55BDEB),
      ),
      SenseOption(
        name: 'Cotton',
        emoji: '☁️',
        color: Color(0xFF9A72E9),
      ),
      SenseOption(
        name: 'Rock',
        emoji: '🪨',
        color: Color(0xFF777777),
      ),
    ],
  ];

  final List<int> correctAnswers = [0, 1, 0, 1, 1];

  SenseItem get currentSense => senses[currentIndex.value];

  List<SenseOption> get optionsForCurrent => options[currentIndex.value];

  String get questionForCurrent {
    switch (currentIndex.value) {
      case 0:
        return 'Where is the apple?';
      case 1:
        return 'Who makes the sound?';
      case 2:
        return 'Which one has a smell?';
      case 3:
        return 'Which one tastes sweet?';
      case 4:
        return 'Which one is soft?';
      default:
        return '';
    }
  }

  bool get isFirst => currentIndex.value == 0;

  bool get isLast => currentIndex.value == senses.length - 1;

  double get progress => (currentIndex.value + 1) / senses.length;

  @override
  void onInit() {
    super.onInit();
    _initTts();
  }

  @override
  void onReady() {
    super.onReady();

    Future.delayed(
      const Duration(milliseconds: 1000),
      () {
        if (!_isClosed && _ttsReady) {
          teachCurrent();
        }
      },
    );
  }

  Future<void> _initTts() async {
    try {
      await _tts.setLanguage('en-US');
      await _tts.setSpeechRate(0.42);
      await _tts.setPitch(1.0);
      await _tts.setVolume(1.0);
      await _tts.awaitSpeakCompletion(true);

      _tts.setStartHandler(() {
        if (!_isClosed) {
          isSpeaking.value = true;
        }
      });

      _tts.setCompletionHandler(() {
        if (!_isClosed) {
          isSpeaking.value = false;
        }
      });

      _tts.setCancelHandler(() {
        if (!_isClosed) {
          isSpeaking.value = false;
        }
      });

      _tts.setErrorHandler((message) {
        if (!_isClosed) {
          isSpeaking.value = false;
        }
      });

      _ttsReady = true;
    } catch (e) {
      debugPrint('English TTS Error: $e');
    }
  }

  Future<void> _speak(String text) async {
    if (_isClosed || !_ttsReady) return;

    try {
      await _tts.stop();
      await _tts.setLanguage('en-US');
      await _tts.speak(text);
    } catch (e) {
      debugPrint('English TTS Error: $e');
    }
  }

  Future<void> teachCurrent() async {
    if (_isClosed || !_ttsReady) return;

    isTeaching.value = true;
    highlightedOptionIndex.value = -1;

    await _tts.stop();
    await _animalPlayer.stop();

    if (_isClosed) return;

    await _speak(
      '${currentSense.name}. ${currentSense.description}',
    );

    if (_isClosed) return;

    await Future.delayed(
      const Duration(milliseconds: 450),
    );

    if (_isClosed) return;

    await _speak(
      questionForCurrent,
    );

    if (_isClosed) return;

    await Future.delayed(
      const Duration(milliseconds: 450),
    );

    if (_isClosed) return;

    if (currentIndex.value == 1) {
      await _animalPlayer.play(
        AssetSource(AppOudio.dog_oudio),
      );

      await Future.delayed(
        const Duration(milliseconds: 1500),
      );

      if (_isClosed) return;
    }

    final currentOptions = optionsForCurrent;

    for (int i = 0; i < currentOptions.length; i++) {
      if (_isClosed) return;

      highlightedOptionIndex.value = i;

      await _speak(
        currentOptions[i].name,
      );

      if (_isClosed) return;

      await Future.delayed(
        const Duration(milliseconds: 500),
      );

      if (_isClosed) return;

      highlightedOptionIndex.value = -1;

      await Future.delayed(
        const Duration(milliseconds: 150,
      ));
    }

    if (_isClosed) return;

    highlightedOptionIndex.value = -1;
    isTeaching.value = false;
  }

  Future<void> speakCurrent() async {
    if (_isClosed || !_ttsReady) return;

    await _tts.stop();
    await _animalPlayer.stop();

    await _speak(
      '${currentSense.name}. ${currentSense.description}',
    );
  }

  void selectSense(int index) {
    if (_isClosed) return;

    if (index < 0 || index >= senses.length) {
      return;
    }

    currentIndex.value = index;
    teachCurrent();
  }

  void nextSense() {
    if (_isClosed || isLast) return;

    currentIndex.value++;
    teachCurrent();
  }

  void previousSense() {
    if (_isClosed || isFirst) return;

    currentIndex.value--;
    teachCurrent();
  }

  Future<void> checkAnswer(
    int index,
    BuildContext context,
  ) async {
    if (_isClosed || isTeaching.value) {
      return;
    }

    final correct = index == correctAnswers[currentIndex.value];

    if (!correct) {
      await _speak('Try again');
      return;
    }

    totalStars.value++;

    await _tts.stop();
    await _animalPlayer.stop();

    if (_isClosed) return;

    await _speak('Great job! Correct answer');

    if (_isClosed) return;

    ConfettiEngine.celebrate(
      context,
      preset: Preset.nova,
      feedback: CelebrationFeedback.bundledForPreset(
        Preset.nova,
      ),
    );

    if (isLast) {
      Future.delayed(
        const Duration(milliseconds: 700),
        () {
          if (!_isClosed) {
            _showFinishedDialog(context);
          }
        },
      );
      return;
    }

    Future.delayed(
      const Duration(milliseconds: 900),
      () {
        if (!_isClosed) {
          nextSense();
        }
      },
    );
  }

  void _showFinishedDialog(BuildContext context) {
    if (_isClosed) return;

    Get.dialog(
      Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(32),
        ),
        child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.emoji_events_rounded,
                size: 90,
                color: Color(0xFFFFB52E),
              ),
              const SizedBox(height: 12),
              const Text(
                'Congratulations! 🎉',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              const Text(
                'You are a senses expert!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 21,
                ),
              ),
              const SizedBox(height: 15),
              Obx(
                () => Text(
                  '⭐ ${totalStars.value} Stars',
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFFFFB52E),
                  ),
                ),
              ),
              const SizedBox(height: 22),
              ElevatedButton(
                onPressed: () {
                  Get.back();
                  currentIndex.value = 0;
                  totalStars.value = 0;
                  teachCurrent();
                },
                child: const Text(
                  'Play Again',
                  style: TextStyle(
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onClose() {
    _isClosed = true;
    _ttsReady = false;
    isSpeaking.value = false;
    highlightedOptionIndex.value = -1;
    isTeaching.value = false;

    _tts.stop();
    _animalPlayer.stop();
    _animalPlayer.dispose();

    super.onClose();
  }
}