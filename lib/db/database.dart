import 'dart:io';
import 'package:path/path.dart' as p;

import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseProvider {
  DatabaseProvider._();
  static final DatabaseProvider databaseProvider = DatabaseProvider._();

  Database _database;

  Future<Database> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabase();
    return _database;
  }
}

initDatabase() async {
  Directory documentsDirectory = await getApplicationDocumentsDirectory();
  String path = p.join(documentsDirectory.path, "cred.db");
  return await openDatabase(path, version: 1, onOpen: (db) {},
      onCreate: (Database db, int version) async {
    await db.execute("CREATE TABLE cred_table ("
        "id INTEGER PRIMARY KEY,"
        "user_name TEXT,"
        "password TEXT"
        ")");
  });
}
