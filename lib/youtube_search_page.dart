import 'package:flutter/material.dart';
import 'package:youtube_app/youtube_service.dart'; // YouTubeServiceのインポート

class YouTubeSearchPage extends StatefulWidget {
  @override
  _YouTubeSearchPageState createState() => _YouTubeSearchPageState();
}

class _YouTubeSearchPageState extends State<YouTubeSearchPage> {
  TextEditingController _controller = TextEditingController();
  List<dynamic> _videos = [];

  void _searchVideos() async {
    final videos = await YouTubeService().fetchVideos(_controller.text);
    setState(() {
      _videos = videos;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('YouTube Search')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                labelText: 'Search for videos',
                suffixIcon: IconButton(
                  icon: Icon(Icons.search),
                  onPressed: _searchVideos,
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _videos.length,
              itemBuilder: (context, index) {
                final video = _videos[index];
                final title = video['snippet']['title'];
                final thumbnailUrl = video['snippet']['thumbnails']['medium']['url'];

                return ListTile(
                  leading: Image.network(thumbnailUrl),
                  title: Text(title),
                  onTap: () {
                    // 動画を再生する処理へ遷移
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
