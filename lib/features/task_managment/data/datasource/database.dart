import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  static Database? _database;
  static const String TABLE_TASKS = 'tasks';

  Future<Database> get db async {
    if (_database != null) {
      return _database!;
    }
    return _database = await openDatabaseAndCreateTable();
  }

  Future<Database> openDatabaseAndCreateTable() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, 'my_database.db');

    // openDb
    return openDatabase(
      path,
      onCreate: (db, version) {
        //create table
        return db.execute(
          'CREATE TABLE $TABLE_TASKS '
          '(id INTEGER PRIMARY KEY AUTOINCREMENT,'
          'taskName TEXT,'
          'taskDescription TEXT,'
          'deadline INTEGER,'
          'prio INTEGER,'
          'owner TEXT,'
          'status INTEGER'
          ')',
        );
      },
      version: 1,
    );
  }

  Future close() async {
    var actualDatabase = await db;
    actualDatabase.close();
  }
}
