
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class StoryText extends StatefulWidget {
  const StoryText({
    super.key,
    required this.text,
    required this.onTextTap,
  });

  final String text;
  final void Function(String text) onTextTap;

  @override
  State<StoryText> createState() => _StoryTextState();
}

class _StoryTextState extends State<StoryText> {
  late final List<TapGestureRecognizer> _recognizers;

  @override
  void initState() {
    super.initState();

    final words = widget.text.split(' ');

    _recognizers = words.map((word) {
      final cleanWord = word.replaceAll(
        RegExp(r"[^a-zA-Z0-9']"),
        '',
      );

      return TapGestureRecognizer()
        ..onTap = () {
          if (cleanWord.isNotEmpty) {
            widget.onTextTap(cleanWord);
          }
        };
    }).toList();
  }

  List<TextSpan> _buildWords() {
    final words = widget.text.split(' ');

    return words.asMap().entries.map((entry) {
      final index = entry.key;
      final word = entry.value;

      return TextSpan(
        text: '$word ',
        style: const TextStyle(
          fontFamily: 'Amiri',
          fontSize: 21,
          height: 1.8,
          fontWeight: FontWeight.bold,
          color: Color(0xFF293657),
        ),
        recognizer: _recognizers[index],
      );
    }).toList();
  }

  @override
  void dispose() {
    for (final recognizer in _recognizers) {
      recognizer.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SelectableText.rich(
      TextSpan(
        children: _buildWords(),
      ),
      textAlign: TextAlign.center,
      style: const TextStyle(
        fontFamily: 'Amiri',
        fontSize: 21,
        height: 1.8,
        fontWeight: FontWeight.bold,
        color: Color(0xFF293657),
      ),
      onSelectionChanged: (selection, cause) {
        if (selection.start == selection.end) {
          return;
        }

        final selectedText = widget.text
            .substring(
              selection.start,
              selection.end,
            )
            .trim();

        if (selectedText.isEmpty) {
          return;
        }

        if (selectedText.contains(' ')) {
          WidgetsBinding.instance.addPostFrameCallback((_) {
            if (mounted) {
              widget.onTextTap(selectedText);
            }
          });
        }
      },
    );
  }
}
