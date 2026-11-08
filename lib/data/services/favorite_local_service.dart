import 'package:lab5_prm/data/local/app_database.dart';
import 'package:lab5_prm/data/models/photo.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'favorite_local_service.g.dart';

@Riverpod(keepAlive: true)
FavoriteLocalService favoriteLocalService(Ref ref) {
  return FavoriteLocalService(ref.watch(appDatabaseProvider));
}

class FavoriteLocalService {
  FavoriteLocalService(this._database);

  final AppDatabase _database;

  Future<void> insert(Photo photo) async {
    final db = await _database.database;
    await db.insert(
      'PhoTo',
      photo.toMap(),
      conflictAlgorithm: ConflictAlgorithm.ignore,
    );
  }

  Future<List<Photo>> getAll() async {
    final db = await _database.database;
    final rows = await db.query('PhoTo', orderBy: 'photo_id DESC');
    return rows.map(Photo.fromMap).toList();
  }

  Future<void> deleteById(int photoId) async {
    final db = await _database.database;
    await db.delete('PhoTo', where: 'photo_id = ?', whereArgs: [photoId]);
  }
}
