import 'package:flutter_application_codeft/view-model/music_video_viewmodal.dart';
import 'package:flutter_test/flutter_test.dart';

class MockHttpClient {}

void main() {
  group('MusicVideoViewModel', () {
    test('fetchMusicVideos returns list of music videos', () async {
      final viewModel = MusicVideoViewModel();
      await viewModel.fetchMusicVideos();
      expect(viewModel.state.isNotEmpty, true);
    });
  });
}
