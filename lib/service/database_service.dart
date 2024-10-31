import 'package:path/path.dart';
import 'package:pstyle/model/must_item_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService {
  static final DatabaseService _databaseService = DatabaseService._internal();
  late Future<Database> database;

  factory DatabaseService() => _databaseService;
  DatabaseService._internal() {
    databaseConfig();
  }

  Future<bool> databaseConfig() async {
    try {
      database = openDatabase(
        join(await getDatabasesPath(), 'must.db'),
        version: 1,
        onCreate: (db, version) {
          return db.execute('''
            CREATE TABLE mustItems (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        isDone INTEGER NOT NULL DEFAULT 0,
        deadline TEXT ,
        isImportant INTEGER DEFAULT 0,
        isDaily INTEGER DEFAULT 0,
        estimatedTime INTEGER
      )

            ''');
        },
      );

      return true;
    } catch (err) {
      print(err.toString());
      return false;
    }
  }

  // CRUD 메서드
  Future<int> createMustItem(MustItemModel item) async {
    final db = await _databaseService.database;
    return await db.insert('mustItems', item.toMap());
  }

  Future<List<MustItemModel>> readAllMustItems() async {
    final db = await _databaseService.database;
    final result = await db.query('mustItems');
    return result.map((map) => MustItemModel.fromMap(map)).toList();
  }

  Future<int> updateMustItem(MustItemModel item) async {
    final db = await _databaseService.database;
    return await db.update(
      'mustItems',
      item.toMap(),
      where: 'id = ?',
      whereArgs: [item.id],
    );
  }

  Future<int> deleteMustItem(int id) async {
    final db = await _databaseService.database;
    return await db.delete(
      'mustItems',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
