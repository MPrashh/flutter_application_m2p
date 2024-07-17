import 'package:flutter/material.dart';

import '../models/music_video.dart';

class MusicVideoTile extends StatelessWidget {
  final MusicVideo video;
  final VoidCallback onTap;

  const MusicVideoTile({super.key, required this.video, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.network(video.artworkUrl),
      title: Text(video.trackName),
      subtitle: Text(video.artistName),
      //trailing: Text(video.),
      onTap: onTap,
    );
  }
}
