import 'package:path/path.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'app_database.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  final database = AppDatabase();
  ref.onDispose(database.close);
  return database;
}

class AppDatabase {
  static const _databaseName = 'lab5_photo.db';
  Future<Database>? _database;

  Future<Database> get database => _database ??= _openDatabase();

  Future<Database> _openDatabase() async {
    final databasePath = await getDatabasesPath();
    return openDatabase(
      join(databasePath, _databaseName),
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE PhoTo(
            photo_id INTEGER PRIMARY KEY,
            album_id INTEGER NOT NULL,
            title TEXT NOT NULL,
            url TEXT NOT NULL,
            thumbnail_url TEXT NOT NULL
          )
        ''');
      },
    );
  }

  Future<void> close() async {
    final openedDatabase = _database;
    if (openedDatabase != null) {
      await (await openedDatabase).close();
      _database = null;
    }
  }
}
