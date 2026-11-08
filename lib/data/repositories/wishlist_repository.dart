import 'package:lab5_prm/data/models/photo.dart';
import 'package:lab5_prm/data/services/favorite_local_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wishlist_repository.g.dart';

@Riverpod(keepAlive: true)
WishlistRepository wishlistRepository(Ref ref) {
  return WishlistRepository(ref.watch(favoriteLocalServiceProvider));
}

class WishlistRepository {
  WishlistRepository(this._service);

  final FavoriteLocalService _service;

  Future<List<Photo>> getWishlist() => _service.getAll();

  Future<void> add(Photo photo) => _service.insert(photo);

  Future<void> remove(int photoId) => _service.deleteById(photoId);
}
