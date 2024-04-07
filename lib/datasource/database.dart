import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

// Funkcja otwierająca bazę danych i tworząca tabelę
Future<Database> openDatabaseAndCreateTable() async {
  // Uzyskanie ścieżki do miejsca przechowywania bazy danych
  final databasePath = await getDatabasesPath();
  final path = join(databasePath, 'my_database.db');

  // Otwarcie bazy danych, stworzenie jeśli nie istnieje
  return openDatabase(
    path,
    onCreate: (db, version) {
      // Wykonanie instrukcji SQL tworzącej tabelę
      return db.execute(
        'CREATE TABLE tasks(id INTEGER PRIMARY KEY, name TEXT, description TEXT)',
      );
    },
    version: 1,
  );
}