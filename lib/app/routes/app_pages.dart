import 'package:get/get.dart';
import 'package:test1/features/arabic/bindings/number_binding.dart';
import 'package:test1/features/arabic/bindings/science_binding.dart';
import 'package:test1/features/arabic/bindings/senses_binding.dart';
import 'package:test1/features/arabic/screens/numbers_screen.dart';
import 'package:test1/features/arabic/screens/writing_screen.dart';
import 'package:test1/features/colors/screens/arabic_colors_screen.dart';

import '../../features/arabic/bindings/writing_binding.dart';
import '../../features/colors/bindings/arabic_colors_binding.dart';
import '../../features/colors/bindings/english_colors_binding.dart';
import '../../features/colors/screens/english_colors_screen.dart';
import '../../features/english/bindings/english_letters_binding.dart';
import '../../features/english/bindings/english_senses_binding.dart';
import '../../features/english/bindings/english_week_days_binding.dart';
import '../../features/english/bindings/english_writing_binding.dart';
import '../../features/english/bindings/english_writing_numbers_binding.dart';
import '../../features/english/bindings/stories_binding.dart';
import '../../features/english/screens/english_letters_screen.dart';
import '../../features/english/screens/english_senses_screen.dart';
import '../../features/english/screens/english_week_days_screen.dart';
import '../../features/english/screens/english_writing_numbers_screen.dart';
import '../../features/english/screens/english_writing_screen.dart';
import '../../features/english/screens/stories_screen.dart';
import '../../features/islam/binding/ablution_binding.dart';
import '../../features/islam/binding/azan_binding.dart';
import '../../features/islam/binding/islam_binding.dart';
import '../../features/islam/binding/pillars_of_faith_binding.dart';
import '../../features/islam/binding/pillars_of_islam_binding.dart';
import '../../features/islam/binding/tashahhud_binding.dart';
import '../../features/islam/screen/ablution_screen.dart';
import '../../features/islam/screen/azan_screen.dart';
import '../../features/islam/screen/islam_screen.dart';
import '../../features/islam/screen/pillars_of_faith_screen.dart';
import '../../features/islam/screen/pillars_of_islam_screen.dart';
import '../../features/islam/screen/tashahhud_screen.dart';
import '../../features/science/screens/senses_screen.dart';
import '../../features/home/bindings/home_binding.dart';
import '../../features/home/screens/home_screen.dart';

import '../../features/arabic/bindings/arabic_binding.dart';
import '../../features/arabic/screens/arabic_screen.dart';
import '../../features/arabic/bindings/letter_binding.dart';
import '../../features/arabic/screens/letters_screen.dart';

import '../../features/english/bindings/english_binding.dart';
import '../../features/english/bindings/english_numbers_binding.dart';
import '../../features/english/screens/english_screen.dart';
import '../../features/english/screens/english_numbers_screen.dart';

import '../../features/science/screens/animal_sounds_screen.dart';
import '../../features/science/screens/science_screen.dart';
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
    ),
    GetPage(
      name: AppRoutes.science,
      page: () => const ScienceScreen(),
      binding: ScienceBinding(),
    ),
    GetPage(
      name: AppRoutes.animalSounds,
      page: () => const AnimalSoundsScreen(),
      binding: ScienceBinding(),
    ),
    GetPage(
      name: AppRoutes.english,
      page: () => const EnglishScreen(),
      binding: EnglishBinding(),
    ),
    GetPage(
      name: AppRoutes.englishNumbers,
      page: () => const EnglishNumbersScreen(),
      binding: EnglishNumbersBinding(),
    ),
    GetPage(
      name: AppRoutes.englishLetters,
      page: () => const EnglishLettersScreen(),
      binding: EnglishLettersBinding(),
    ),
    GetPage(
      name: AppRoutes.englishColors,
      page: () => const EnglishColorsScreen(),
      binding: EnglishColorsBinding(),
    ),
    GetPage(
      name: AppRoutes.arabicColors,
      page: () => const ArabicColorsScreen(),
      binding: ArabicColorsBinding(),
    ),
    GetPage(
      name: AppRoutes.englishWritingLetters,
      page: () => const EnglishWritingScreen(),
      binding: EnglishWritingBinding(),
    ),
    GetPage(
      name: AppRoutes.englishWritingNumbers,
      page: () => const EnglishWritingNumbersScreen(),
      binding: EnglishWritingNumbersBinding(),
    ),
    GetPage(
      name: AppRoutes.englishWeekDays,
      page: () => const EnglishWeekDaysScreen(),
      binding: EnglishWeekDaysBinding(),
    ),
    GetPage(
      name: AppRoutes.englishSenses,
      page: () => const EnglishSensesScreen(),
      binding: EnglishSensesBinding(),
    ),
    GetPage(
      name: AppRoutes.englishStories,
      page: () => const StoriesScreen(),
      binding: StoriesBinding(),
    ),
    GetPage(
      name: AppRoutes.islam,
      page: () => const IslamScreen(),
      binding: IslamBinding(),
    ),
    GetPage(
      name: AppRoutes.pillarsOfIslam,
      page: () => const PillarsOfIslamScreen(),
      binding: PillarsOfIslamBinding(),
    ),
    GetPage(
      name: AppRoutes.pillarsOfFaith,
      page: () => const PillarsOfFaithScreen(),
      binding: PillarsOfFaithBinding(),
    ),
    GetPage(
      name: AppRoutes.azan,
      page: () => const AzanScreen(),
      binding: AzanBinding(),
    ),
    GetPage(
      name: AppRoutes.tashahhud,
      page: () => const TashahhudScreen(),
      binding: TashahhudBinding(),
    ),
    GetPage(
      name: AppRoutes.ablution,
      page: () => const AblutionScreen(),
      binding: AblutionBinding(),
    ),
  ];
}
