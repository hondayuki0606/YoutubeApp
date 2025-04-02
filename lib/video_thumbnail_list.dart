import 'package:flutter/material.dart';
import 'package:youtube_app/src/models/video_model.dart';
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
    return FutureBuilder<List<Video>>(
      future: fetchVideos(type),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(child: CircularProgressIndicator());
        } else if (snapshot.hasError) {
          return Center(child: Text('エラーが発生しました'));
        } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
          return Center(child: Text('動画がありません'));
        }

        final videos = snapshot.data!;
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
      },
    );
  }

  Future<List<Video>> fetchVideos(TabType type) async {
    int itemCount = 0;
    switch (type) {
      case TabType.home:
        itemCount = 10;
        break;
      case TabType.search:
        itemCount = 5;
        break;
      case TabType.settings:
        itemCount = 4;
        break;
    }
    // 実際に非同期で動画データを取得するコードを追加
    return VideoService().getVideos(itemCount); // 例えば、10件の動画を取得する
  }
}
