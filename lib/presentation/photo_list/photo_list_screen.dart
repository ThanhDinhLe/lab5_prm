import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lab5_prm/presentation/photo_list/photo_list_view_model.dart';
import 'package:lab5_prm/presentation/shared/photo_card.dart';
import 'package:lab5_prm/presentation/theme/theme_mode_switch.dart';
import 'package:lab5_prm/presentation/wishlist/wishlist_screen.dart';
import 'package:lab5_prm/presentation/wishlist/wishlist_view_model.dart';

class PhotoListScreen extends ConsumerWidget {
  const PhotoListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoState = ref.watch(photoListViewModelProvider);
    final wishlistState = ref.watch(wishlistViewModelProvider);
    final favoriteIds = (wishlistState.value ?? const [])
        .map((photo) => photo.id)
        .toSet();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Danh sách Photo'),
        actions: [
          const ThemeModeSwitch(),
          IconButton(
            tooltip: 'WishListPhoto',
            icon: const Icon(Icons.favorite),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute<void>(builder: (_) => const WishlistScreen()),
              );
            },
          ),
        ],
      ),
      body: photoState.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => _ErrorView(
          message: 'Không thể tải danh sách ảnh.',
          onRetry: () =>
              ref.read(photoListViewModelProvider.notifier).refresh(),
        ),
        data: (photos) {
          if (photos.isEmpty) {
            return const Center(child: Text('Không có ảnh từ API.'));
          }

          return RefreshIndicator(
            onRefresh: () =>
                ref.read(photoListViewModelProvider.notifier).refresh(),
            child: ListView.builder(
              padding: const EdgeInsets.all(8),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final photo = photos[index];
                return PhotoCard(
                  key: ValueKey(photo.id),
                  photo: photo,
                  isFavorite: favoriteIds.contains(photo.id),
                  onFavoritePressed: () {
                    ref
                        .read(wishlistViewModelProvider.notifier)
                        .toggleFavorite(photo);
                  },
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class _ErrorView extends StatelessWidget {
  const _ErrorView({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(message),
          const SizedBox(height: 12),
          FilledButton.icon(
            onPressed: onRetry,
            icon: const Icon(Icons.refresh),
            label: const Text('Thử lại'),
          ),
        ],
      ),
    );
  }
}
