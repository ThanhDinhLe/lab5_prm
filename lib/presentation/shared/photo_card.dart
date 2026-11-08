import 'package:flutter/material.dart';
import 'package:lab5_prm/data/models/photo.dart';

class PhotoCard extends StatelessWidget {
  const PhotoCard({
    super.key,
    required this.photo,
    required this.isFavorite,
    required this.onFavoritePressed,
  });

  final Photo photo;
  final bool isFavorite;
  final VoidCallback onFavoritePressed;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: ListTile(
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(8),
          child: Image.network(
            photo.thumbnailUrl,
            width: 64,
            height: 64,
            fit: BoxFit.cover,
            errorBuilder: (_, _, _) => const SizedBox(
              width: 64,
              height: 64,
              child: Icon(Icons.broken_image_outlined),
            ),
          ),
        ),
        title: Text(photo.title, maxLines: 2, overflow: TextOverflow.ellipsis),
        subtitle: Text('Photo # ${photo.id}'),
        trailing: IconButton(
          tooltip: isFavorite ? 'Bỏ quan tâm' : 'Quan tâm',
          icon: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
            color: isFavorite ? Colors.red : null,
          ),
          onPressed: onFavoritePressed,
        ),
      ),
    );
  }
}
