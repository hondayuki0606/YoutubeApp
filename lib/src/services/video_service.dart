import 'package:youtube_app/Video.dart';

class VideoService {
  List<Video> getVideos() {
    return List.generate(
      4,
          (index) => Video(
        thumbnail: 'https://rollingstone.com.br/media/_versions/2024/02/rick-astley-photo-by-belinda-jiao-getty-images_widelg.jpg',
        videoId: 'dQw4w9WgXcQ',
      ),
    );
  }
}