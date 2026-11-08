import 'package:lab5_prm/data/models/photo.dart';
import 'package:lab5_prm/data/repositories/wishlist_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wishlist_view_model.g.dart';

@riverpod
class WishlistViewModel extends _$WishlistViewModel {
  @override
  Future<List<Photo>> build() {
    return ref.watch(wishlistRepositoryProvider).getWishlist();
  }

  Future<void> toggleFavorite(Photo photo) async {
    final repository = ref.read(wishlistRepositoryProvider);
    final currentPhotos = state.value ?? await repository.getWishlist();
    final isFavorite = currentPhotos.any((item) => item.id == photo.id);

    state = const AsyncLoading();
    state = await AsyncValue.guard(() async {
      if (isFavorite) {
        await repository.remove(photo.id);
      } else {
        await repository.add(photo);
      }
      return repository.getWishlist();
    });
  }
}
