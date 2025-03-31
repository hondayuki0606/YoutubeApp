import 'package:flutter/material.dart';
import 'package:youtube_app/src/services/video_service.dart';
import 'package:youtube_app/video_thumbnail_item.dart';

enum TabType {
  home,
  search,
  settings,
}

class VideoThumbnailList extends StatelessWidget {
  final TabType type;

  const VideoThumbnailList({super.key, required this.type});

  @override
  Widget build(BuildContext context) {
    var itemCount = 0;
    switch (type) {
      case TabType.home:
        itemCount = 10;
      case TabType.search:
        itemCount = 5;
      case TabType.settings:
        itemCount = 4;
    }
    final videos = VideoService().getVideos(itemCount);
    return Scaffold(
      appBar: AppBar(
        title: Text('$type サムネイルと動画再生'),
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8.0,
          mainAxisSpacing: 8.0,
        ),
        itemCount: videos.length,
        itemBuilder: (context, index) {
          return VideoThumbnailItem(video: videos[index]);
        },
      ),
    );
  }
}
