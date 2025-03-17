import 'dart:convert';
import 'package:http/http.dart' as http;

class YouTubeService {
  final String apiKey = 'YOUR_API_KEY'; // ここにあなたのAPIキーを入力します。

  Future<List<dynamic>> fetchVideos(String query) async {
    final url = 'https://www.googleapis.com/youtube/v3/search?part=snippet&q=$query&key=$apiKey';
    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['items'];
    } else {
      throw Exception('Failed to load videos');
    }
  }
}
