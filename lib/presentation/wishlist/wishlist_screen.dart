import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab5_prm/presentation/shared/photo_card.dart';
import 'package:lab5_prm/presentation/theme/theme_mode_switch.dart';
import 'package:lab5_prm/presentation/wishlist/wishlist_view_model.dart';

class WishlistScreen extends ConsumerWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final wishlistState = ref.watch(wishlistViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('WishListPhoto'),
        actions: const [ThemeModeSwitch()],
      ),
      body: wishlistState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) =>
            const Center(child: Text('Không thể đọc danh sách yêu thích.')),
        data: (photos) {
          if (photos.isEmpty) {
            return const Center(
              child: Text('Chưa có Photo nào được quan tâm.'),
            );
          }

          return ListView.builder(
            padding: const EdgeInsets.all(8),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              final photo = photos[index];
              return PhotoCard(
                key: ValueKey(photo.id),
                photo: photo,
                isFavorite: true,
                onFavoritePressed: () {
                  ref
                      .read(wishlistViewModelProvider.notifier)
                      .toggleFavorite(photo);
                },
              );
            },
          );
        },
      ),
    );
  }
}
