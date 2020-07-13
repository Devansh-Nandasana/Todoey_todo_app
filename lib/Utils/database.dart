import 'dart:io';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:todoey/Models/task.dart';

class DatabaseHelper {
  static final _dbName = "todoey.db";
  static final _tableName = "tasktable";
  static final _colID = "id";
  static final _colTask = "taskDescription";
  static final _colCheck = "checkbox";
  DatabaseHelper._privateConstructor();
  static final DatabaseHelper instance = DatabaseHelper._privateConstructor();
  static Database _database;
  List<int> colIDList = [];
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await _initialiseDB();
    return _database;
  }

  Future<Database> _initialiseDB() async {
    // print('YOYOYOYOY');
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(
      path,
      version: 1,
      onCreate: _oncreate,
    );
  }

  Future<List<Task>> getInitialValue() async {
    Database db = await instance.database;

    List<Map<String, dynamic>> lists = await db.query(
      _tableName,
    );
    print('YOYOYOYOY');
    print(lists);
    List<Task> temp = [];
    for (var m in lists) {
      temp.add(Task(
        name: m[_colTask],
        isDone: m[_colCheck] == 0 ? false : true,
      ));
      colIDList.add(m[_colID]);
    }
    return temp;
  }

  Future<int> update(Task task, int colID) async {
    Database db = await instance.database;
    return await db.update(
      _tableName,
      {
        _colCheck: task.isDone ? 1 : 0,
      },
      where: '$_colID = ?',
      whereArgs: [colID],
    );
  }

  Future<int> delete(int colID) async {
    Database db = await instance.database;
    return await db.delete(
      _tableName,
      where: '$_colID = ?',
      whereArgs: [colID],
    );
  }

  List<int> givecolIDValue() {
    return colIDList;
  }

  Future<int> insert(String taskdes) async {
    return await _database.insert(_tableName, {
      _colTask: taskdes,
      _colCheck: 0,
    });
  }

  void _oncreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE $_tableName($_colID INTEGER PRIMARY KEY AUTOINCREMENT, $_colTask TEXT, $_colCheck INTEGER)');
  }
}
// await db.execute(
//       '''
//       CREATE TABLE $_tableName(
//         $_colID INTEGER PRIMARY KEY,
//         $_colTask TEXT,
//         $_colCheck INTEGER )
//       ''',
