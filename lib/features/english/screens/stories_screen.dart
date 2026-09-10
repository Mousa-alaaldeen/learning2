import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/icon_broken.dart';
import '../controllers/stories_controller.dart';
import '../widgets/story_card.dart';
import 'story_details_screen.dart';

class StoriesScreen extends GetView<StoriesController> {
  const StoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.lettersTitle,
        title: const Text(
          'English Stories',
          style: TextStyle(
            fontFamily: 'Amiri',
            fontSize: 26,
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
      body: Obx(
        () => GridView.builder(
          padding: const EdgeInsets.fromLTRB(16, 10, 16, 30),
          physics: const BouncingScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 14,
            mainAxisSpacing: 14,
            childAspectRatio: .84,
          ),
          itemCount: controller.stories.length,
          itemBuilder: (context, index) {
            final story = controller.stories[index];

            return StoryCard(
              story: story,
              onTap: () {
                Get.to(
                  () => StoryDetailsScreen(story: story),
                );
              },
            );
          },
        ),
      ),
    );
  }
}