import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'Video.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoThumbnailList(),
    );
  }
}


class VideoThumbnailList extends StatelessWidget {
  final List<Video> videos = [
    Video(
      thumbnail: 'https://rollingstone.com.br/media/_versions/2024/02/rick-astley-photo-by-belinda-jiao-getty-images_widelg.jpg',
      videoId: 'dQw4w9WgXcQ',
    ),
    Video(
      thumbnail: 'https://rollingstone.com.br/media/_versions/2024/02/rick-astley-photo-by-belinda-jiao-getty-images_widelg.jpg',
      videoId: 'dQw4w9WgXcQ',
    ),
    Video(
      thumbnail: 'https://rollingstone.com.br/media/_versions/2024/02/rick-astley-photo-by-belinda-jiao-getty-images_widelg.jpg',
      videoId: 'dQw4w9WgXcQ',
    ),
    Video(
      thumbnail: 'https://rollingstone.com.br/media/_versions/2024/02/rick-astley-photo-by-belinda-jiao-getty-images_widelg.jpg',
      videoId: 'dQw4w9WgXcQ',
    ),
  ];

  VideoThumbnailList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('サムネイルと動画再生'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      VideoPlayerScreen(videoUrl: videos[index].videoId),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Image.network(videos[index].thumbnail),
                  SizedBox(height: 8),
                  Text('動画 ${index + 1}', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class VideoPlayerScreen extends StatefulWidget {
  final String videoUrl;

  VideoPlayerScreen({super.key, required this.videoUrl});

  @override
  VideoPlayerScreenState createState() => VideoPlayerScreenState();
}

class VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoUrl, // YouTube動画のID
      flags: YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('YouTube Player')),
      body: YoutubePlayer(
        controller: _controller,
        showVideoProgressIndicator: true,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
