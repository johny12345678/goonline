import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBhelper {
  static Database? _database;
  static const String tableName = 'tasks';

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
          'CREATE TABLE $tableName'
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

  Future <void> printTasks() async {
    final path = await getDatabasesPath();
    final database = join(path, 'my_databasse.db');

    
    final db = await openDatabase(database);
    final List<Map<String, dynamic>> tasks = await db.query(tableName);
    for (var task in tasks){
      print(task);
    }

  }

  Future close() async {
    var actualDatabase = await db;
    actualDatabase.close();
  }
}
