class Video {
  final String thumbnail;
  final String videoId;

  Video({
    required this.thumbnail,
    required this.videoId,
  });

  // JSON形式への変換
  Map<String, String> toJson() {
    return {
      'thumbnail': thumbnail,
      'videoId': videoId,
    };
  }

  // JSONからVideoオブジェクトを生成
  factory Video.fromJson(Map<String, String> json) {
    return Video(
      thumbnail: json['thumbnail']!,
      videoId: json['videoId']!,
    );
  }
}
