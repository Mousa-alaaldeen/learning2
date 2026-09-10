import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:translator/translator.dart';

import '../../../component/app_images.dart';
import '../../../core/theme/app_colors.dart';
import '../../../data/models/story_model.dart';


class StoriesController extends GetxController {
  final FlutterTts tts = FlutterTts();

  final RxList<StoryModel> stories = <StoryModel>[
    StoryModel(
      image: AppImages.story1,
      title: 'The Little Cat',
      subtitle: 'A cute little cat',
      text:
          'This is a little cat. The cat is small and beautiful. It likes to play with a ball. Every day, the cat plays in the garden.',
      icon: Icons.pets_rounded,
      color: AppColors.arabicNumbers,
    ),
    StoryModel(
      image: AppImages.story2,
      title: 'The Red Ball',
      subtitle: 'A fun red ball',
      text:
          'Tom has a red ball. He likes to play with it every day. He throws the ball and runs after it. Tom is very happy.',
      icon: Icons.sports_baseball_rounded,
      color: AppColors.arabicLetters,
    ),
    StoryModel(
      image: AppImages.story3,
      title: 'The Little Bird',
      subtitle: 'A bird in the tree',
      text:
          'A little bird lives in a big tree. Every morning, it sings a beautiful song. The bird loves the warm sun and the green trees.',
      icon: Icons.flutter_dash_rounded,
      color: AppColors.numbersGreen,
    ),
    StoryModel(
      image: AppImages.story4,
      title: 'My Family',
      subtitle: 'A happy family',
      text:
          'I have a small family. I live with my father, mother, brother, and sister. We eat together and play together every day.',
      icon: Icons.family_restroom_rounded,
      color: AppColors.sensesBlue,
    ),
    StoryModel(
      image: AppImages.story5,
      title: 'The Big Tree',
      subtitle: 'A beautiful tree',
      text:
          'There is a big tree near my house. It has many green leaves. Birds sit on its branches and sing every morning.',
      icon: Icons.park_rounded,
      color: AppColors.numbersDecorationPurple,
    ),
    StoryModel(
      image: AppImages.story6,
      title: 'Going to School',
      subtitle: 'A school day',
      text:
          'Ali gets up early every morning. He eats breakfast and goes to school. He learns new things and plays with his friends.',
      icon: Icons.school_rounded,
      color: AppColors.arabicWriting,
    ),
    StoryModel(
      image: AppImages.story7,
      title: 'The Rainy Day',
      subtitle: 'A rainy morning',
      text:
          'It is raining today. Sara puts on her coat and takes her umbrella. She likes to watch the rain from the window.',
      icon: Icons.umbrella_rounded,
      color: AppColors.arabicNumbers,
    ),
    StoryModel(
      image: AppImages.story8,
      title: 'The Lost Toy',
      subtitle: 'Find the toy',
      text:
          'Omar cannot find his favorite toy. He looks in his room, under the bed, and behind the door. Finally, he finds it in his bag.',
      icon: Icons.toys_rounded,
      color: AppColors.arabicLetters,
    ),
    StoryModel(
      image: AppImages.story9,
      title: 'At the Park',
      subtitle: 'Fun at the park',
      text:
          'Maya goes to the park with her brother. They run, jump, and play together. They have a wonderful day at the park.',
      icon: Icons.park_rounded,
      color: AppColors.numbersGreen,
    ),
    StoryModel(
      image: AppImages.story10,
      title: 'The Little Dog',
      subtitle: 'A friendly dog',
      text:
          'A little dog lives near our house. It is friendly and playful. It likes to run and play with children in the garden.',
      icon: Icons.pets_rounded,
      color: AppColors.sensesBlue,
    ),
    StoryModel(
      image: AppImages.story11,
      title: 'A Sunny Day',
      subtitle: 'The sun is shining',
      text:
          'The sun is shining today. The sky is blue and the weather is warm. The children go outside and enjoy the beautiful day.',
      icon: Icons.wb_sunny_rounded,
      color: AppColors.numbersDecorationPurple,
    ),
    StoryModel(
      image: AppImages.story12,
      title: 'My Birthday',
      subtitle: 'A special day',
      text:
          'Today is my birthday. My family gives me a beautiful cake. We sing, eat cake, and take many pictures together.',
      icon: Icons.cake_rounded,
      color: AppColors.arabicWriting,
    ),
  ].obs;

  Future<void> speak(String text) async {
    await tts.setLanguage('en-US');
    await tts.setSpeechRate(.42);
    await tts.speak(text);
  }

  Future<void> stop() async {
    await tts.stop();
  }
Future<void> translateText(String text) async {
  final cleanText = text.trim();

  if (cleanText.isEmpty) {
    return;
  }

  final translation = await cleanText.translate(
    from: 'en',
    to: 'ar',
  );

  Get.dialog(
    AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      title: Text(
        cleanText,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontFamily: 'Amiri',
          fontSize: 23,
          fontWeight: FontWeight.w900,
          color: Color(0xFF293657),
        ),
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            translation.text,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontFamily: 'Amiri',
              fontSize: 23,
              fontWeight: FontWeight.bold,
              color: AppColors.lettersTitle,
            ),
          ),
          const SizedBox(height: 18),
          IconButton(
            onPressed: () => speak(cleanText),
            icon: const Icon(
              Icons.volume_up_rounded,
              size: 32,
            ),
          ),
        ],
      ),
      actionsAlignment: MainAxisAlignment.center,
      actions: [
        TextButton(
          onPressed: Get.back,
          child: const Text(
            'Close',
            style: TextStyle(
              fontFamily: 'Amiri',
              fontSize: 17,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    ),
  );
}

  @override
  void onClose() {
    tts.stop();
    super.onClose();
  }
}