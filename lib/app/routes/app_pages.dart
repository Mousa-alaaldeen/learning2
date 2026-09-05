import 'package:get/get.dart';
import 'package:test1/features/arabic/bindings/number_binding.dart';
import 'package:test1/features/arabic/screens/numbers_screen.dart';
import 'package:test1/features/arabic/screens/writing_screen.dart';

import '../../features/arabic/bindings/senses_binding.dart' show SensesBinding;
import '../../features/arabic/bindings/writing_binding.dart';
import '../../features/arabic/screens/senses_screen.dart';
import '../../features/home/bindings/home_binding.dart';
import '../../features/home/screens/home_screen.dart';

import '../../features/arabic/bindings/arabic_binding.dart';
import '../../features/arabic/screens/arabic_screen.dart';
import '../../features/arabic/bindings/letter_binding.dart';
import '../../features/arabic/screens/letters_screen.dart';

import 'app_routes.dart';

class AppPages {
  static final pages = <GetPage>[
    GetPage(
      name: AppRoutes.home,
      page: () => const HomeScreen(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: AppRoutes.arabic,
      page: () => const ArabicScreen(),
      binding: ArabicBinding(),
    ),
    GetPage(
      name: AppRoutes.arabicLetters,
      page: () => const LettersScreen(),
      binding: LetterBinding(),
    ),
    GetPage(
      name: AppRoutes.arabicNumbers,
      page: () => const NumbersScreen(),
      binding: NumberBinding(),
    ),
    GetPage(
      name: AppRoutes.arabicSenses,
      page: () => SensesScreen(),
      binding: SensesBinding(),
    ),
    GetPage(
      name: AppRoutes.arabicWriting,
      page: () => const WritingScreen(),
      binding: WritingBinding(),
    )
  ];
}
