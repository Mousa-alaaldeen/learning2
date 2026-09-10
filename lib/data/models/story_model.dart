import 'package:flutter/material.dart';

class StoryModel {
  const StoryModel({
    required this.image,
    required this.title,
    required this.subtitle,
    required this.text,
    required this.icon,
    required this.color,
  });

  final String image;
  final String title;
  final String subtitle;
  final String text;
  final IconData icon;
  final Color color;
}