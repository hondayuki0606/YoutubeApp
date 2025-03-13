import 'dart:convert';
import 'package:http/http.dart' as http;

class YoutubeAPI {
  final String apiKey = 'YOUR_YOUTUBE_API_KEY'; // YouTube APIキー

  Future<List<Map<String, dynamic>>> searchVideos(String query) async {
    final response = await http.get(
      Uri.parse(
          'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$query&type=video&key=$apiKey'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<Map<String, dynamic>> videos = [];
      for (var item in data['items']) {
        videos.add({
          'title': item['snippet']['title'],
          'videoId': item['id']['videoId'],
          'thumbnail': item['snippet']['thumbnails']['default']['url'],
        });
      }
      return videos;
    } else {
      throw Exception('Failed to load YouTube videos');
    }
  }
}
