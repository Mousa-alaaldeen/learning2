import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VedioScreen extends StatefulWidget {
  final String url;
  final String text;

  const VedioScreen({
    Key? key,
    required this.url,
    required this.text,
  }) : super(key: key);

  @override
  State<VedioScreen> createState() => _VedioScreenState();
}

class _VedioScreenState extends State<VedioScreen> {
  late VideoPlayerController _videoController;

  @override
  void initState() {
    super.initState();

    _videoController = VideoPlayerController.asset(widget.url)
      ..initialize().then((_) {
        if (mounted) {
          setState(() {});
        }
      });
  }

  @override
  void dispose() {
    _videoController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              width: double.infinity,
              child: _videoController.value.isInitialized
                  ? AspectRatio(
                      aspectRatio: _videoController.value.aspectRatio,
                      child: VideoPlayer(_videoController),
                    )
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ),
            SizedBox(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.6,
              child: Image.asset(
                widget.text,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}