import 'package:flutter/material.dart';
import 'package:youtube_app/video_thumbnail_list.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TabScreen(),
    );
  }
}


class TabScreen extends StatelessWidget {
  const TabScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DefaultTabController(
        length: 3, // タブの数
        child: Scaffold(
          appBar: AppBar(
            title: Text('Flutter Tabs Example'),
            bottom: TabBar(
              tabs: [
                Tab(icon: Icon(Icons.home), text: 'ホーム'),
                Tab(icon: Icon(Icons.search), text: '検索'),
                Tab(icon: Icon(Icons.settings), text: '設定'),
              ],
            ),
          ),
          body: TabBarView(
            children: [
              Center(child:  VideoThumbnailList()),
              Center(child:  VideoThumbnailList()),
              Center(child:  VideoThumbnailList()),
            ],
          ),
        ),
      ),
    );
  }
}