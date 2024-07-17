import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/music_video.dart';

class ApiService {
  final String baseUrl = 'https://itunes.apple.com/search';

  Future<List<MusicVideo>> fetchMusicVideos(String term) async {
    final response = await http.get(Uri.parse('$baseUrl?term=$term&entity=musicVideo'));

    if (response.statusCode == 200) {
      final List<dynamic> json = jsonDecode(response.body)['results'];
      return json.map((e) => MusicVideo.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load music videos');
    }
  }
}
