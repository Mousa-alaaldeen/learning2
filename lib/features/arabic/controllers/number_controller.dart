
import 'package:get/get.dart';
import '../../../core/services/tts_service.dart';
import '../../../data/local/learning_data.dart';
import '../../../data/models/number_model.dart';

class NumberController extends GetxController {
  final TtsService _ttsService = TtsService();

  final List<NumberModel> numbers = LearningData.arabicNumbers;

  final currentIndex = 0.obs;

  final visibleObjects = 0.obs;


  final isCounting = false.obs;


  final totalStars = 0.obs;

  NumberModel get currentNumber => numbers[currentIndex.value];

  bool get isFirst => currentIndex.value == 0;

  bool get isLast => currentIndex.value == numbers.length - 1;

  double get progress {
    if (numbers.isEmpty) return 0;

    return (currentIndex.value + 1) / numbers.length;
  }

  @override
  void onInit() {
    super.onInit();

    _ttsService.init();


    playCounting();
  }

  // ==========================================================

  // ==========================================================

  Future<void> speakNumber() async {
    await _ttsService.speak(
      currentNumber.name,
    );
  }

  // ==========================================================

  // ==========================================================

  Future<void> playCounting() async {
    if (isCounting.value) return;

    isCounting.value = true;

    visibleObjects.value = 0;

   
    await Future.delayed(
      const Duration(milliseconds: 300),
    );

    final count = currentNumber.value;

    for (int i = 1; i <= count; i++) {
      if (isClosed) return;

      // تظهر التفاحة الجديدة
      visibleObjects.value = i;

      // قراءة الرقم
      await _ttsService.speak(
        _numberName(i),
      );

      // ننتظر قليلًا قبل التفاحة التالية
      await Future.delayed(
        const Duration(milliseconds: 300),
      );
    }

    isCounting.value = false;
  }

  // ==========================================================
  // أسماء الأرقام
  // ==========================================================

  String _numberName(int number) {
    switch (number) {
      case 1:
        return 'واحد';

      case 2:
        return 'اثنان';

      case 3:
        return 'ثلاثة';

      case 4:
        return 'أربعة';

      case 5:
        return 'خمسة';

      case 6:
        return 'ستة';

      case 7:
        return 'سبعة';

      case 8:
        return 'ثمانية';

      case 9:
        return 'تسعة';

      case 10:
        return 'عشرة';

      default:
        return '';
    }
  }

  // ==========================================================
  // الرقم التالي
  // ==========================================================

  void nextNumber() {
    if (isLast) return;

    _ttsService.stop();

    isCounting.value = false;

    currentIndex.value++;

    // يبدأ عد الرقم الجديد تلقائيًا
    playCounting();
  }

  // ==========================================================
  // الرقم السابق
  // ==========================================================

  void previousNumber() {
    if (isFirst) return;

    _ttsService.stop();

    isCounting.value = false;

    currentIndex.value--;

    playCounting();
  }

  @override
  void onClose() {
    _ttsService.dispose();

    super.onClose();
  }
}
