class Photo {
  const Photo({
    required this.id,
    required this.albumId,
    required this.title,
    required this.url,
    required this.thumbnailUrl,
  });

  final int id;
  final int albumId;
  final String title;
  final String url;
  final String thumbnailUrl;

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: (json['id'] as num).toInt(),
      albumId: (json['albumId'] as num).toInt(),
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );
  }

  factory Photo.fromMap(Map<String, Object?> map) {
    return Photo(
      id: map['photo_id'] as int,
      albumId: map['album_id'] as int,
      title: map['title'] as String,
      url: map['url'] as String,
      thumbnailUrl: map['thumbnail_url'] as String,
    );
  }

  Map<String, Object> toMap() {
    return {
      'photo_id': id,
      'album_id': albumId,
      'title': title,
      'url': url,
      'thumbnail_url': thumbnailUrl,
    };
  }
}
