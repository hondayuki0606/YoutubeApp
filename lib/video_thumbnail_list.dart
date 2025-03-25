import 'package:flutter/material.dart';
import 'package:youtube_app/video_player_screen.dart';
import 'Video.dart';

final List<Video> videos = [
  Video(
    thumbnail:
    'https://rollingstone.com.br/media/_versions/2024/02/rick-astley-photo-by-belinda-jiao-getty-images_widelg.jpg',
    videoId: 'dQw4w9WgXcQ',
  ),
  Video(
    thumbnail:
    'https://rollingstone.com.br/media/_versions/2024/02/rick-astley-photo-by-belinda-jiao-getty-images_widelg.jpg',
    videoId: 'dQw4w9WgXcQ',
  ),
  Video(
    thumbnail:
    'https://rollingstone.com.br/media/_versions/2024/02/rick-astley-photo-by-belinda-jiao-getty-images_widelg.jpg',
    videoId: 'dQw4w9WgXcQ',
  ),
  Video(
    thumbnail:
    'https://rollingstone.com.br/media/_versions/2024/02/rick-astley-photo-by-belinda-jiao-getty-images_widelg.jpg',
    videoId: 'dQw4w9WgXcQ',
  ),
];
class VideoThumbnailList extends StatelessWidget {

  const VideoThumbnailList({super.key});

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
              margin: EdgeInsets.all(20),
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
