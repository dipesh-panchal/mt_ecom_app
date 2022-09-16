import 'dart:io';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static const _databaseName = "Products.db";
  static const _databaseVersion = 1;

  static const table = 'product_table';

  //table Product Columns
  static const id = 'id';
  static const title = 'title';
  static const description = 'description';
  static const price = 'price';
  static const image = 'featured_image';
  static const inTheCart = 'inTheCart';

  DatabaseHelper.internal();

  Database? _db;
  static final DatabaseHelper instance = DatabaseHelper.internal();

  factory DatabaseHelper() => instance;
  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await _init();
    return _db!;
  }

  _init() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, _databaseName);
    return await openDatabase(path,
        version: _databaseVersion, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    String createTableProductQuery = '''
          CREATE TABLE $table (
            $id INTEGER PRIMARY KEY,
            $title TEXT,
            $description TEXT,
            $image TEXT,
            $price INTEGER,
            $inTheCart INTEGER
          )
          ''';
    await db
        .execute(createTableProductQuery)
        .catchError((error) => PrintLog.printMessage(error.toString()));
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.db;
    return await db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    Database db = await instance.db;
    return await db.query(table);
  }
  Future<int> delete(int id) async {
    Database db = await instance.db;
    return await db.delete(table, where: '$id = ?', whereArgs: [id]);
  }
}

class PrintLog {
  static void printMessage(String message) {
    debugPrint(message);
  }
}
