import 'package:sqflite/sqflite.dart';

import '../../models/task_model.dart';

class DatabaseHelper {
  DatabaseHelper._internal();
  static final DatabaseHelper instance = DatabaseHelper._internal();

  static const String _databaseName = 'soso.db';
  static const int _databaseVersion = 1;
  static const String _tableName = "Tasks";
  static const String _coulmId = 'id';
  static const String _remind = 'remind';
  static const String _repeat = 'repeat';
  static const String _date = 'date';
  static const String _startTime = 'startTime';
  static const String _endTime = 'endTime';
  static const String _note = 'note';
  static const String _title = 'title';

  static Database? _db;

  Future<Database> get _database async {
    if (_db != null) return _db!;
    _db = await _intilizeDatabase();
    return _db!;
  }

  Future<Database> _intilizeDatabase() async {
    final dpPath = await getDatabasesPath();
    final String path = '$dpPath/$_databaseName';
    return await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  _onCreate(Database db, int version) async {
    return await db.execute(''' 
 CREATE TABLE $_tableName(
      $_coulmId INTEGER PRIMARY KEY,
      $_title TEXT NOT NULL,
      $_startTime TEXT NOT NULL,
      $_endTime TEXT NOT NULL,
      $_date TEXT NOT NULL,
      $_note TEXT NOT NULL,
      $_remind INTEGER NOT NULL,
      $_repeat TEXT NOT NULL
    )
     ''');
  }

  Future<List<TaskModel>> getDatabase() async {
    Database dp = await instance._database;
    List<Map<String, dynamic>> response = await dp.query(_tableName, columns: [
      _coulmId,
      _title,
      _startTime,
      _endTime,
      _date,
      _note,
      _remind,
      _repeat,
    ]);
    return response.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future<int> insertToDatabase(TaskModel model) async {
    Database dp = await instance._database;
    return await dp.insert(_tableName, model.toMap());
  }

  Future<int> updateDatabase(int id, TaskModel model) async {
    Database dp = await instance._database;
    return await dp.update(
      _tableName,
      model.toMap(),
      where: '$_coulmId = ?',
      whereArgs: [id],
    );
  }

  Future<List<TaskModel>> searchOnDatabase(String title) async {
    Database dp = await instance._database;
    List<Map<String, dynamic>> response = await dp.query(
      _tableName,
      where: '$_title LIKE ?',
      whereArgs: ['%$title%'],
    );
    return response.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future<int> deleteDatabase(int id) async {
    Database dp = await instance._database;
    return await dp.delete(
      _tableName,
      where: "$_coulmId=?",
      whereArgs: [id],
    );
  }
}
