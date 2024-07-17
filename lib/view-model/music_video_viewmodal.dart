import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import '../models/music_video.dart';

final musicVideoProvider = StateNotifierProvider<MusicVideoViewModel, List<MusicVideo>>((ref) {
  return MusicVideoViewModel();
});

class MusicVideoViewModel extends StateNotifier<List<MusicVideo>> {
  MusicVideoViewModel() : super([]);

  Future<void> fetchMusicVideos() async {
    final response = await http.get(Uri.parse('https://itunes.apple.com/search?term=jackjohnson&entity=musicVideo'));
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      final List<dynamic> results = data['results'];
      state = results.map((json) => MusicVideo.fromJson(json)).toList();
    } else {
      throw Exception('Failed to load music videos');
    }
  }
}
