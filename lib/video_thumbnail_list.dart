import 'package:flutter/material.dart';
import 'package:youtube_app/video_thumbnail_item.dart';
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
  final String type;

  const VideoThumbnailList({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$type サムネイルと動画再生'),
      ),
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          VideoThumbnailItem(video: videos[index]);
        },
      ),
    );
  }
}
