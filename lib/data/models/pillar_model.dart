
import 'package:flutter/material.dart';

class PillarModel {
  const PillarModel({
    required this.title,
    required this.description,
    required this.emoji,
    required this.icon,
    required this.color,
  });

  final String title;
  final String description;
  final String emoji;
  final IconData icon;
  final Color color;
}