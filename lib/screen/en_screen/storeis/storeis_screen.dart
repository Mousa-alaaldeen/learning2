// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:test1/component/styles.dart';

import 'package:translator/translator.dart';

class StoriesScreen extends StatefulWidget {
  const StoriesScreen({Key? key, required this.image, required this.title})
      : super(key: key);
  final String image;
  final String title;
  @override
  _StoriesScreenState createState() => _StoriesScreenState();
}

class _StoriesScreenState extends State<StoriesScreen> {
  FlutterTts flutterTts = FlutterTts();
  final translator = GoogleTranslator();

  @override
  void dispose() {
    flutterTts.stop(); // إيقاف الصوت عند مغادرة الصفحة
    super.dispose();
  }

  Future<void> _speak(String text) async {
    await flutterTts.speak(text);
  }

  Future<void> _showTranslation(String word) async {
    final translation = await translator.translate(word, from: 'en', to: 'ar');
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Translation'),
          content: Text(translation.toString()),
          actions: [
            IconButton(
              onPressed: () {
                _speak(word);
              },
              icon: const Icon(Icons.volume_up),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    String storyText = widget.title;

    final words = storyText.split(' ');

    List<InlineSpan> spans = [];

    for (var word in words) {
      spans.add(
        TextSpan(
          text: '$word ',
          style: const TextStyle(
            fontSize: 18.0,
          ),
          recognizer: TapGestureRecognizer()
            ..onTap = () {
              _showTranslation(word);
            },
        ),
      );
    }
    Future speak(String text) async {
      await flutterTts.setVolume(1.0);
      await flutterTts.speak(text);
    }

    return Localizations.override(
      context: context,
      locale: const Locale('en'),
      child: Scaffold(
        // appBar: AppBar(
        //   title: const Text(''),
        // ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const CircleAvatar(
                      radius: 25,
                      child: Icon(
                        Icons.keyboard_arrow_left_sharp,
                      ),
                    )),
              ),
            ),
            Image.asset(widget.image),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: SelectableText.rich(
                TextSpan(children: spans, style: Styles.textStyle30),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            speak(storyText);
          },
          child: const Icon(Icons.volume_up),
        ),
      ),
    );
  }
}
