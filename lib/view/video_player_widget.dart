import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerWidget extends StatelessWidget {
  final VideoPlayerController controller;

  VideoPlayerWidget({required this.controller});

  @override
  Widget build(BuildContext context) {
    return VideoPlayer(controller);
  }
}
