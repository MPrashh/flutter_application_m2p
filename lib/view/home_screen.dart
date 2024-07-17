import 'package:flutter/material.dart';
import 'package:flutter_application_codeft/view-model/music_video_viewmodal.dart';
import 'package:flutter_application_codeft/view/details_screen.dart';
import 'package:flutter_application_codeft/view/music_video_tile.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import '../viewmodels/music_video_viewmodel.dart';
// import '../widgets/music_video_tile.dart';
// import 'details_screen.dart';

class HomeScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final musicVideos = ref.watch(musicVideoProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Music Videos'),
        actions: [
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              ref.read(musicVideoProvider.notifier).fetchMusicVideos();
            },
          ),
        ],
      ),
      body: musicVideos.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: musicVideos.length,
              itemBuilder: (context, index) {
                final video = musicVideos[index];
                return MusicVideoTile(
                  video: video,
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DetailsScreen(video: video),
                      ),
                    );
                  },
                );
              },
            ),
    );
  }
}
