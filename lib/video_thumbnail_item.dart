import 'package:flutter/material.dart';
import 'package:youtube_app/src/theme/text_styles.dart';
import 'package:youtube_app/video_player_screen.dart';
import 'Video.dart';

class VideoThumbnailItem extends StatelessWidget {
  final Video video;

  const VideoThumbnailItem({super.key, required this.video});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => VideoPlayerScreen(videoUrl: video.videoId),
          ),
        );
      },
      child: Card(
        margin: EdgeInsets.all(20),
        elevation: 4,
        child: Column(
          children: [
            Image.network(video.thumbnail),
            SizedBox(height: 8),
            Text('動画 ${video.videoId}', style: videoTextStyle),
          ],
        ),
      ),
    );
  }
}