import 'package:flutter/material.dart';
import 'package:flutter_application_codeft/view/video_player_widget.dart';
import 'package:video_player/video_player.dart';

import '../models/music_video.dart';

class DetailsScreen extends StatefulWidget {
  final MusicVideo video;

  const DetailsScreen({super.key, required this.video});

  @override
  _DetailsScreenState createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.video.previewUrl)
      ..initialize().then((_) {
        setState(() {});
        _controller.play();
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.video.trackName),
      ),
      body: Column(
        children: [
          Image.network(widget.video.artworkUrl),
          Text(widget.video.artistName),
          _controller.value.isInitialized
              ? AspectRatio(
                  aspectRatio: _controller.value.aspectRatio,
                  child: VideoPlayerWidget(controller: _controller),
                )
              : const CircularProgressIndicator(),
        ],
      ),
    );
  }
}
