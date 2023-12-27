// ignore_for_file: deprecated_member_use

import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:flutter/material.dart';

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
  late VideoPlayerController _videoPlayerController;

  late CustomVideoPlayerController _customVideoPlayerController;

  final CustomVideoPlayerSettings _customVideoPlayerSettings =
      const CustomVideoPlayerSettings(showSeekButtons: true);

  @override
  void initState() {
    super.initState();

    _videoPlayerController = VideoPlayerController.asset(widget.url)
      ..initialize().then((value) => setState(() {}));

    _customVideoPlayerController = CustomVideoPlayerController(
      context: context,
      videoPlayerController: _videoPlayerController,
      customVideoPlayerSettings: _customVideoPlayerSettings,
    );
  }

  @override
  void dispose() {
    _customVideoPlayerController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Stack(
          children: [
            Column(
              children: [
                Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Stack(
                      children: [
                        CustomVideoPlayer(
                          customVideoPlayerController:
                              _customVideoPlayerController,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.6,
                  child: Image.asset(
                    widget.text,
                    fit: BoxFit.contain,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
