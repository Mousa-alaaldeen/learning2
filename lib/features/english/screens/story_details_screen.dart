// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/icon_broken.dart';
import '../../../data/models/story_model.dart';
import '../controllers/stories_controller.dart';
import '../widgets/story_text.dart';

class StoryDetailsScreen extends GetView<StoriesController> {
  const StoryDetailsScreen({
    super.key,
    required this.story,
  });

  final StoryModel story;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.lettersTitle,
        title: Text(
          story.title,
          style: const TextStyle(
            fontFamily: 'Amiri',
            fontSize: 25,
            fontWeight: FontWeight.w900,
            color: AppColors.lettersTitle,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            IconBroken.arrowRight,
            color: AppColors.lettersTitle,
          ),
          onPressed: Get.back,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: story.color,
        onPressed: () => controller.speak(story.text),
        child: const Icon(
          Icons.volume_up_rounded,
          color: Colors.white,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 30),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 230,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                boxShadow: [
                  BoxShadow(
                    color: story.color.withOpacity(.18),
                    blurRadius: 18,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  story.image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(28),
                boxShadow: [
                  BoxShadow(
                    color: story.color.withOpacity(.12),
                    blurRadius: 18,
                    offset: const Offset(0, 7),
                  ),
                ],
              ),
              child: StoryText(
                text: story.text,
                onTextTap: controller.translateText,
              ),
            ),
            const SizedBox(height: 15),
            Text(
              'Tap a word or select words to translate',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Amiri',
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: story.color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
