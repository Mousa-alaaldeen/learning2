import 'package:flutter/material.dart';

import '../../../core/widgets/common/learning_category_card.dart';
import '../../../data/models/story_model.dart';


class StoryCard extends StatelessWidget {
  const StoryCard({
    super.key,
    required this.story,
    required this.onTap,
  });

  final StoryModel story;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return LearningCategoryCard(
      title: story.title,
      subtitle: story.subtitle,
      icon: story.icon,
      color: story.color,
      onTap: onTap,
      startText: 'Start',
    );
  }
}