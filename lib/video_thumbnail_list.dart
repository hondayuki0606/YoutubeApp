import 'package:flutter/material.dart';
import 'package:youtube_app/video_thumbnail_item.dart';
import 'Video.dart';

class VideoThumbnailList extends StatelessWidget {
  final String type;

  const VideoThumbnailList({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('$type サムネイルと動画再生'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing:
          8.0,
        ),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoThumbnailItem(video: videos[index]);
        },
      ),
    );
  }
}
