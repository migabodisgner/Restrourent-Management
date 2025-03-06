// ignore_for_file: depend_on_referenced_packages

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._init();
  static Database? _database;

  DatabaseHelper._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB("users.db");
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future<void> _createDB(Database db, int version) async {
    await db.execute('''
      CREATE TABLE users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        fullname TEXT,
        phone TEXT UNIQUE,
        password TEXT
      )
    ''');
  }

  Future<int> registerUser(String fullName, String phone, String password) async {
    final db = await database;
    return await db.insert("users", {
      "fullname": fullName,
      "phone": phone,
      "password": password
    });
  }

  Future<Map<String, dynamic>?> getUser(String phone, String password) async {
    final db = await database;
    final result = await db.query(
      "users",
      where: "phone = ? AND password = ?",
      whereArgs: [phone, password],
    );

    return result.isNotEmpty ? result.first : null;
  }
}
