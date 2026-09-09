import 'package:flutter/material.dart';

class SenseItem {
  final String name;
  final String description;
  final String emoji;
  final Color color;

  const SenseItem({
    required this.name,
    required this.description,
    required this.emoji,
    required this.color,
  });
}