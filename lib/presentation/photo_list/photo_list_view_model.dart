import 'package:lab5_prm/data/models/photo.dart';
import 'package:lab5_prm/data/repositories/photo_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_list_view_model.g.dart';

@riverpod
class PhotoListViewModel extends _$PhotoListViewModel {
  @override
  Future<List<Photo>> build() {
    return ref.watch(photoRepositoryProvider).getPhotos();
  }

  Future<void> refresh() async {
    ref.invalidateSelf();
    await future;
  }
}
