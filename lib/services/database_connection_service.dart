import 'package:flutter_url_shortener/models/create_history_modal.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnectionService {
  Future<Database> initialiseDatabase() async {
    String path = await getDatabasesPath();
    final database = openDatabase(
      join(path, 'kissi.db'),
      onCreate: createDatabase,
      version: 1,
    );
    return database;
  }

  Future<void> createDatabase(Database database, int value) async {
    await database.execute(
      "CREATE TABLE url (id INTEGER PRIMARY KEY AUTOINCREMENT, linkName TEXT, longLink TEXT, shortLink TEXT)",
    );
  }

  Future<int> createItem(CreateHistoryModal createhistory) async {
    int result = 0;
    final Database database = await initialiseDatabase();
    final id = await database.insert('url', createhistory.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    return id;
  }

  Future<List<CreateHistoryModal>> getItem() async {
    final Database db = await initialiseDatabase();
    final List<Map<String, Object?>> queryResult = await db.query(
      'url',
    );
    return queryResult.map((e) => CreateHistoryModal.fromMap(e)).toList();
  }

  Future<void> deleteItem(String id) async {
    final database = await initialiseDatabase();
    try {
      await database.delete("url", where: "id = ?", whereArgs: [id]);
    } catch (e, s) {
      print("exception $e");
      print("stack $s");
    }
  }
}
