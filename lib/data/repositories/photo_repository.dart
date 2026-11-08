import 'package:lab5_prm/data/models/photo.dart';
import 'package:lab5_prm/data/services/photo_api_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_repository.g.dart';

@riverpod
PhotoRepository photoRepository(Ref ref) {
  return PhotoRepository(PhotoApiService());
}

class PhotoRepository {
  PhotoRepository(this._service);

  final PhotoApiService _service;

  Future<List<Photo>> getPhotos() => _service.fetchPhotos();
}
