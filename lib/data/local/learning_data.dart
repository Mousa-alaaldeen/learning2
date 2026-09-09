import 'package:flutter/material.dart';

import 'package:test1/data/models/letter_model.dart';
import '../../component/app_audio.dart';
import '../models/sense_option_model.dart';
import '../models/number_model.dart';

class LearningData {
  static const List<LetterModel> arabicLetters = [
    LetterModel(
      letter: 'أ',
      word: 'أسد',
      emoji: '🦁',
    ),
    LetterModel(
      letter: 'ب',
      word: 'بطة',
      emoji: '🦆',
    ),
    LetterModel(
      letter: 'ت',
      word: 'تمساح',
      emoji: '🐊',
    ),
    LetterModel(
      letter: 'ث',
      word: 'ثعلب',
      emoji: '🦊',
    ),
    LetterModel(
      letter: 'ج',
      word: 'جمل',
      emoji: '🐪',
    ),
    LetterModel(
      letter: 'ح',
      word: 'حوت',
      emoji: '🐋',
    ),
    LetterModel(
      letter: 'خ',
      word: 'خروف',
      emoji: '🐑',
    ),
    LetterModel(
      letter: 'د',
      word: 'ديك',
      emoji: '🐓',
    ),
    LetterModel(
      letter: 'ذ',
      word: 'ذهب',
      emoji: '🥇',
    ),
    LetterModel(
      letter: 'ر',
      word: 'رمان',
      emoji: '🍎',
    ),
    LetterModel(
      letter: 'ز',
      word: 'زرافة',
      emoji: '🦒',
    ),
    LetterModel(
      letter: 'س',
      word: 'سمكة',
      emoji: '🐟',
    ),
    LetterModel(
      letter: 'ش',
      word: 'شمس',
      emoji: '☀️',
    ),
    LetterModel(
      letter: 'ص',
      word: 'صقر',
      emoji: '🦅',
    ),
    LetterModel(
      letter: 'ض',
      word: 'ضفدع',
      emoji: '🐸',
    ),
    LetterModel(
      letter: 'ط',
      word: 'طاووس',
      emoji: '🦚',
    ),
    LetterModel(
      letter: 'ظ',
      word: 'ظبي',
      emoji: '🦌',
    ),
    LetterModel(
      letter: 'ع',
      word: 'عقرب',
      emoji: '🦂',
    ),
    LetterModel(
      letter: 'غ',
      word: 'غزال',
      emoji: '🦌',
    ),
    LetterModel(
      letter: 'ف',
      word: 'فيل',
      emoji: '🐘',
    ),
    LetterModel(
      letter: 'ق',
      word: 'قرد',
      emoji: '🐒',
    ),
    LetterModel(
      letter: 'ك',
      word: 'كلب',
      emoji: '🐕',
    ),
    LetterModel(
      letter: 'ل',
      word: 'ليمور',
      emoji: '🦝',
    ),
    LetterModel(
      letter: 'م',
      word: 'ماعز',
      emoji: '🐐',
    ),
    LetterModel(
      letter: 'ن',
      word: 'نمر',
      emoji: '🐅',
    ),
    LetterModel(
      letter: 'ه',
      word: 'هدهد',
      emoji: '🐦',
    ),
    LetterModel(
      letter: 'و',
      word: 'وحيد القرن',
      emoji: '🦏',
    ),
    LetterModel(
      letter: 'ي',
      word: 'يعسوب',
      emoji: '🪰',
    ),
  ];

  static const List<NumberModel> arabicNumbers = [
    NumberModel(
      number: '١',
      name: 'واحد',
      value: 1,
    ),
    NumberModel(
      number: '٢',
      name: 'اثنان',
      value: 2,
    ),
    NumberModel(
      number: '٣',
      name: 'ثلاثة',
      value: 3,
    ),
    NumberModel(
      number: '٤',
      name: 'أربعة',
      value: 4,
    ),
    NumberModel(
      number: '٥',
      name: 'خمسة',
      value: 5,
    ),
    NumberModel(
      number: '٦',
      name: 'ستة',
      value: 6,
    ),
    NumberModel(
      number: '٧',
      name: 'سبعة',
      value: 7,
    ),
    NumberModel(
      number: '٨',
      name: 'ثمانية',
      value: 8,
    ),
    NumberModel(
      number: '٩',
      name: 'تسعة',
      value: 9,
    ),
    NumberModel(
      number: '١٠',
      name: 'عشرة',
      value: 10,
    ),
  ];

 static final List<AnimalModel> animalsList = [
    AnimalModel(
      emoji: '🐦',
      soundPath: AppOudio.bird_oudio,
      name: 'عصفور',
    ),
    AnimalModel(
      emoji: '🐪',
      soundPath: AppOudio.camel_oudio,
      name: 'جمل',
    ),
    AnimalModel(
      emoji: '🐱',
      soundPath: AppOudio.cat_oudio,
      name: 'قطه',
    ),
    AnimalModel(
      emoji: '🐑',
      soundPath: AppOudio.cheep_oudio,
      name: 'خروف',
    ),
    AnimalModel(
      emoji: '🐓',
      soundPath: AppOudio.chicken_oudio,
      name: 'ديك',
    ),
    AnimalModel(
      emoji: '🐕',
      soundPath: AppOudio.dog_oudio,
      name: 'كلب',
    ),
    AnimalModel(
      emoji: '🐘',
      soundPath: AppOudio.elephant_oudio,
      name: 'فيل',
    ),
    AnimalModel(
      emoji: '🐸',
      soundPath: AppOudio.frog_oudio,
      name: 'ضفدع',
    ),
    AnimalModel(
      emoji: '🦁',
      soundPath: AppOudio.lion_oudio,
      name: 'أسد',
    ),
    AnimalModel(
      emoji: '🐒',
      soundPath: AppOudio.monkey_oudio,
      name: 'قرد',
    ),
    AnimalModel(
      emoji: '🫏',
      soundPath: AppOudio.donkey,
      name: 'حمار',
    ),
    AnimalModel(
      emoji: '🐭',
      soundPath: AppOudio.mouse,
      name: 'فأر',
    ),
    AnimalModel(
      emoji: '🐺',
      soundPath: AppOudio.wolf,
      name: 'ذئب',
    ),
    AnimalModel(
      emoji: '🐄',
      soundPath: AppOudio.cow,
      name: 'بقره',
    ),
    AnimalModel(
      emoji: '🦆',
      soundPath: AppOudio.duck,
      name: 'بطه',
    ),
    AnimalModel(
      emoji: '🦍',
      soundPath: AppOudio.gorilla,
      name: 'غوريلا',
    ),
    AnimalModel(
      emoji: '🐻',
      soundPath: AppOudio.bear,
      name: 'دب',
    ),
    AnimalModel(
      emoji: '🐴',
      soundPath: AppOudio.horse,
      name: 'حصان',
    ),
  ];

static const List<NumberModel> englishNumbers = [
  NumberModel(number: '1', name: 'One', value: 1),
  NumberModel(number: '2', name: 'Two', value: 2),
  NumberModel(number: '3', name: 'Three', value: 3),
  NumberModel(number: '4', name: 'Four', value: 4),
  NumberModel(number: '5', name: 'Five', value: 5),
  NumberModel(number: '6', name: 'Six', value: 6),
  NumberModel(number: '7', name: 'Seven', value: 7),
  NumberModel(number: '8', name: 'Eight', value: 8),
  NumberModel(number: '9', name: 'Nine', value: 9),
  NumberModel(number: '10', name: 'Ten', value: 10),
];
}
