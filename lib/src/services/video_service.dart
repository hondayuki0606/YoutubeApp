import 'package:youtube_app/src/models/video_model.dart';

class VideoService {
  List<Video> getVideos(int itemCount) {
    return List.generate(
      itemCount,
          (index) => Video(
        thumbnail: 'https://rollingstone.com.br/media/_versions/2024/02/rick-astley-photo-by-belinda-jiao-getty-images_widelg.jpg',
        videoId: 'dQw4w9WgXcQ',
      ),
    );
  }
}