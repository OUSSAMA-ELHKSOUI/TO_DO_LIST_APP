import 'package:flutter/cupertino.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import '../task.dart';
import 'package:path_provider/path_provider.dart';

class Sql {

  static Database _db;
  static const String TABLE = 'task';
  static const String NAME = 'name';
  static const String BOOL = 'bool';
  static const String DB_NAME = 'task.db';

  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDB();
    return _db;
  }

  initDB() async {
    io.Directory directory = await getApplicationDocumentsDirectory();
    // var directory =
    //     await io.Directory('database/$DB_NAME').create(recursive: true);
    var db = await openDatabase('${directory.path}/$DB_NAME',
        version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute('CREATE TABLE IF NOT EXISTS $TABLE($NAME TEXT, $BOOL TEXT)');
  }

  Future<void> save(Task task) async {
    var dbTask = await db;
    await dbTask
        .insert(TABLE, {'name': task.name, 'bool': task.isChecked.toString()});
  }

  Future<List<Task>> getTasks() async {
    var dbTask = await db;
    List<Map> maps = await dbTask.query(TABLE, columns: [NAME, BOOL]);
    List<Task> a = [];
    if (maps.length > 0) {
      for (int i = 0; i < maps.length; i++) {
        a.add(Task(name: maps[i]['name']));
      }
    }
    return a;
  }

  Future<int> delete(String name) async {
    var dbTask = await db;
    return await dbTask.delete(TABLE, where: '$NAME = ?', whereArgs: [name]);
  }
}
