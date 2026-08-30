import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter_confetti_engine/flutter_confetti_engine.dart';
import 'package:get/get.dart';

class SenseOption {
  final String name;
  final IconData icon;
  final Color color;

  const SenseOption({
    required this.name,
    required this.icon,
    required this.color,
  });
}

class SenseItem {
  final String name;
  final String description;
  final IconData icon;
  final Color color;

  const SenseItem({
    required this.name,
    required this.description,
    required this.icon,
    required this.color,
  });
}

class SensesController extends GetxController {
  final FlutterTts _tts = FlutterTts();

  final currentIndex = 0.obs;
  final totalStars = 0.obs;
  final isSpeaking = false.obs;

  /// الخيار الذي يتم شرحه حالياً
  final highlightedOptionIndex = (-1).obs;

  /// أثناء الشرح لا يستطيع الطفل الضغط
  final isTeaching = true.obs;

  final List<SenseItem> senses = const [
    SenseItem(
      name: 'البصر',
      description: 'نستخدم أعيننا للرؤية',
      icon: Icons.visibility_rounded,
      color: Color(0xFF35A9F0),
    ),
    SenseItem(
      name: 'السمع',
      description: 'نستخدم أذنينا للسمع',
      icon: Icons.hearing_rounded,
      color: Color(0xFFFFB52E),
    ),
    SenseItem(
      name: 'الشم',
      description: 'نستخدم أنفنا للشم',
      icon: Icons.face_rounded,
      color: Color(0xFF63C83F),
    ),
    SenseItem(
      name: 'التذوق',
      description: 'نستخدم لساننا للتذوق',
      icon: Icons.restaurant_rounded,
      color: Color(0xFFF34F82),
    ),
    SenseItem(
      name: 'اللمس',
      description: 'نستخدم أيدينا للإحساس',
      icon: Icons.touch_app_rounded,
      color: Color(0xFF8759E8),
    ),
  ];

  final List<List<SenseOption>> options = const [
    [
      SenseOption(
        name: 'تفاحة',
        icon: Icons.apple_rounded,
        color: Color(0xFFE84C4C),
      ),
      SenseOption(
        name: 'كرة',
        icon: Icons.sports_soccer_rounded,
        color: Color(0xFF4D8FE8),
      ),
      SenseOption(
        name: 'شمس',
        icon: Icons.wb_sunny_rounded,
        color: Color(0xFFFFB52E),
      ),
    ],
    [
      SenseOption(
        name: 'قطة',
        icon: Icons.pets_rounded,
        color: Color(0xFF8E70E8),
      ),
      SenseOption(
        name: 'كلب',
        icon: Icons.pets_rounded,
        color: Color(0xFFE79B45),
      ),
      SenseOption(
        name: 'بقرة',
        icon: Icons.agriculture_rounded,
        color: Color(0xFF63B77A),
      ),
    ],
    [
      SenseOption(
        name: 'وردة',
        icon: Icons.local_florist_rounded,
        color: Color(0xFFE85B8A),
      ),
      SenseOption(
        name: 'ليمون',
        icon: Icons.circle_rounded,
        color: Color(0xFFE6C62F),
      ),
      SenseOption(
        name: 'صابون',
        icon: Icons.soap_rounded,
        color: Color(0xFF54BFEA),
      ),
    ],
    [
      SenseOption(
        name: 'ليمون',
        icon: Icons.circle_rounded,
        color: Color(0xFFE7C83C),
      ),
      SenseOption(
        name: 'عسل',
        icon: Icons.local_drink_rounded,
        color: Color(0xFFE99B27),
      ),
      SenseOption(
        name: 'بطيخ',
        icon: Icons.water_damage_rounded,
        color: Color(0xFFE95D6F),
      ),
    ],
    [
      SenseOption(
        name: 'ثلج',
        icon: Icons.ac_unit_rounded,
        color: Color(0xFF55BDEB),
      ),
      SenseOption(
        name: 'ريشة',
        icon: Icons.flight_rounded,
        color: Color(0xFF9A72E9),
      ),
      SenseOption(
        name: 'حجر',
        icon: Icons.circle_rounded,
        color: Color(0xFF777777),
      ),
    ],
  ];

  final List<int> correctAnswers = [0, 0, 0, 1, 1];

  SenseItem get currentSense => senses[currentIndex.value];

  List<SenseOption> get optionsForCurrent =>
      options[currentIndex.value];

  String get questionForCurrent {
    switch (currentIndex.value) {
      case 0:
        return 'أين التفاحة؟';

      case 1:
        return 'من صاحب الصوت؟';

      case 2:
        return 'أي شيء له رائحة؟';

      case 3:
        return 'أي شيء طعمه حلو؟';

      case 4:
        return 'أي شيء ناعم؟';

      default:
        return '';
    }
  }

  bool get isFirst => currentIndex.value == 0;

  bool get isLast =>
      currentIndex.value == senses.length - 1;

  double get progress =>
      (currentIndex.value + 1) / senses.length;

  @override
  void onInit() {
    super.onInit();
    _initTts();
  }

  @override
  void onReady() {
    super.onReady();

    Future.delayed(
      const Duration(milliseconds: 700),
      () {
        teachCurrent();
      },
    );
  }

  // ==========================================================
  // TTS
  // ==========================================================

  Future<void> _initTts() async {
    await _tts.setLanguage('ar-SA');
    await _tts.setSpeechRate(0.42);
    await _tts.setPitch(1.15);
    await _tts.setVolume(1);

    // مهم جداً
    await _tts.awaitSpeakCompletion(true);

    _tts.setStartHandler(() {
      isSpeaking.value = true;
    });

    _tts.setCompletionHandler(() {
      isSpeaking.value = false;
    });

    _tts.setCancelHandler(() {
      isSpeaking.value = false;
    });

    _tts.setErrorHandler((message) {
      isSpeaking.value = false;
    });
  }

  Future<void> _speak(String text) async {
    try {
      await _tts.speak(text);
    } catch (e) {
      debugPrint('TTS Error: $e');
    }
  }

  // ==========================================================
  // التعليم
  //
  // 1. الحاسة واستخدامها
  // 2. السؤال
  // 3. الخيارات واحد واحد
  // 4. السماح بالإجابة
  // ==========================================================

  Future<void> teachCurrent() async {
    isTeaching.value = true;
    highlightedOptionIndex.value = -1;

    // إيقاف أي كلام سابق
    await _tts.stop();

    // ========================================================
    // 1. قراءة الحاسة واستخدامها
    // ========================================================

    await _speak(
      '${currentSense.name}. ${currentSense.description}',
    );

    await Future.delayed(
      const Duration(milliseconds: 450),
    );

    // ========================================================
    // 2. قراءة السؤال
    // ========================================================

    await _speak(
      questionForCurrent,
    );

    await Future.delayed(
      const Duration(milliseconds: 450),
    );

    // ========================================================
    // 3. قراءة الخيارات واحد واحد
    // ========================================================

    final currentOptions = optionsForCurrent;

    for (int i = 0; i < currentOptions.length; i++) {
      // إضاءة الخيار
      highlightedOptionIndex.value = i;

      // قراءة اسم الخيار وانتظار انتهاء النطق
      await _speak(
        currentOptions[i].name,
      );

      // وقت بسيط قبل الخيار التالي
      await Future.delayed(
        const Duration(milliseconds: 500),
      );

      // إلغاء الإضاءة قبل الانتقال
      highlightedOptionIndex.value = -1;

      await Future.delayed(
        const Duration(milliseconds: 150),
      );
    }

    // ========================================================
    // 4. انتهى الشرح
    // ========================================================

    highlightedOptionIndex.value = -1;

    isTeaching.value = false;
  }

  // ==========================================================
  // زر الصوت
  // ==========================================================

  Future<void> speakCurrent() async {
    await _tts.stop();

    await _speak(
      '${currentSense.name}. ${currentSense.description}',
    );
  }

  // ==========================================================
  // اختيار الحاسة
  // ==========================================================

  void selectSense(int index) {
    if (index < 0 || index >= senses.length) {
      return;
    }

    currentIndex.value = index;

    teachCurrent();
  }

  // ==========================================================
  // التالي
  // ==========================================================

  void nextSense() {
    if (isLast) return;

    currentIndex.value++;

    teachCurrent();
  }

  // ==========================================================
  // السابق
  // ==========================================================

  void previousSense() {
    if (isFirst) return;

    currentIndex.value--;

    teachCurrent();
  }

  // ==========================================================
  // فحص الإجابة
  // ==========================================================

  Future<void> checkAnswer(
    int index,
    BuildContext context,
  ) async {
    // ممنوع الإجابة أثناء الشرح
    if (isTeaching.value) {
      return;
    }

    final correct =
        index == correctAnswers[currentIndex.value];

    // ========================================================
    // إجابة خاطئة
    // ========================================================

    if (!correct) {
      await _tts.stop();

      await _speak(
        'حاول مرة أخرى',
      );

      return;
    }

    // ========================================================
    // إجابة صحيحة
    // ========================================================

    totalStars.value++;

    await _tts.stop();

    await _speak(
      'أحسنت! إجابة صحيحة',
    );

    ConfettiEngine.celebrate(
      context,
      preset: Preset.nova,
      feedback: CelebrationFeedback.bundledForPreset(
        Preset.nova,
      ),
    );

    // ========================================================
    // آخر سؤال
    // ========================================================

    if (isLast) {
      Future.delayed(
        const Duration(milliseconds: 700),
        () => _showFinishedDialog(context),
      );

      return;
    }

    // ========================================================
    // السؤال التالي
    // ========================================================

    Future.delayed(
      const Duration(milliseconds: 900),
      nextSense,
    );
  }

  // ==========================================================
  // نهاية اللعبة
  // ==========================================================

  void _showFinishedDialog(
    BuildContext context,
  ) {
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
                'مبروك! 🎉',
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 8),

              const Text(
                'أصبحت خبير الحواس!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Amiri',
                  fontSize: 21,
                ),
              ),

              const SizedBox(height: 15),

              Obx(
                () => Text(
                  '⭐ ${totalStars.value} نجوم',
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
                  'إعادة اللعب',
                  style: TextStyle(
                    fontFamily: 'Amiri',
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
    _tts.stop();
    super.onClose();
  }
}