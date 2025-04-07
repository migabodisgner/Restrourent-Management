// ignore_for_file: file_names, depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static const _databaseName = "event.db";
  static const _databaseVersion = 1;

  static const table = 'event_table';
  static const columnId = '_id';
  static const columnTotalPlates = 'totalPlates';
  static const columnUsedPlates = 'usedPlates';
  static const columnIsConfirmed = 'isConfirmed';

  // Make this a singleton class.
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();

  // Only have a single app-wide reference to the database.
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  // Open the database and create the table if it doesn't exist.
  _initDatabase() async {
    String path = join(await getDatabasesPath(), _databaseName);
    return await openDatabase(path, version: _databaseVersion, onCreate: _onCreate);
  }

  // Create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE $table (
        $columnId INTEGER PRIMARY KEY,
        $columnTotalPlates INTEGER NOT NULL,
        $columnUsedPlates INTEGER NOT NULL,
        $columnIsConfirmed INTEGER NOT NULL
      )
    ''');
  }

  // Insert a new event record into the database
  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(table, row);
  }

  // Get the event data
  Future<Map<String, dynamic>?> getEvent() async {
    Database db = await instance.database;
    var result = await db.query(table);
    if (result.isNotEmpty) {
      return result.first;
    }
    return null;
  }

  // Update the event data
  Future<int> update(Map<String, dynamic> row) async {
    Database db = await instance.database;
    int id = row[columnId];
    return await db.update(table, row, where: '$columnId = ?', whereArgs: [id]);
  }
}
