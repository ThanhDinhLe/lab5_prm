import 'package:flutter_test/flutter_test.dart';
import 'package:lab5_prm/data/models/photo.dart';

void main() {
  test('Photo converts API JSON and SQLite map correctly', () {
    final photo = Photo.fromJson({
      'albumId': 1,
      'id': 7,
      'title': 'A photo',
      'url': 'https://example.com/full.jpg',
      'thumbnailUrl': 'https://example.com/thumb.jpg',
    });

    expect(photo.id, 7);
    expect(Photo.fromMap(photo.toMap()).thumbnailUrl, photo.thumbnailUrl);
  });
}
