import 'package:flutter/material.dart';
import 'package:youtube_app/video_thumbnail_list.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

