import 'dart:io';

import 'package:flutter/services.dart';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:turkaiassessment/model/auth.dart';
import 'package:turkaiassessment/model/user.dart';

class DatabaseHelper {
  static DatabaseHelper _databaseHelper;
  static Database _database;

  factory DatabaseHelper() {
    if (_databaseHelper == null) {
      _databaseHelper = DatabaseHelper._internal();
      return _databaseHelper;
    } else {
      return _databaseHelper;
    }
  }

  DatabaseHelper._internal();

  Future<Database> _getDatabase() async {
    if (_database == null) {
      _database = await _initializeDatabase();
      return _database;
    } else {
      return _database;
    }
  }

  Future<Database> _initializeDatabase() async {
    var databasesPath = await getDatabasesPath();
    var path = join(databasesPath, "turk_ai_db.db");

// Check if the database exists
    var exists = await databaseExists(path);

    if (!exists) {
      // Should happen only the first time you launch your application
      print("Creating new copy from asset");

      // Make sure the parent directory exists
      try {
        await Directory(dirname(path)).create(recursive: true);
      } catch (_) {}

      // Copy from asset
      ByteData data =
          await rootBundle.load(join("assets/local_db", "turk_ai_db.db"));
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

      // Write and flush the bytes written
      await File(path).writeAsBytes(bytes, flush: true);
    } else {
      print("Opening existing database");
    }
// open the database
    return await openDatabase(path, readOnly: false);
  }

  Future<List<Map<String, dynamic>>> getAuths() async {
    var db = await _getDatabase();
    var sonuc = await db.query("auths");
    // authsListInDb=sonuc;
    print(sonuc);
    return sonuc;
  }

  Future<bool> addAuths(List<Auth> authList) async {
    var db = await _getDatabase();
     await db.delete("auths");
    for (Auth auth in authList) {
       await db.insert("auths", auth.toJson());
      print("eklenecek olan auth---///>>>" + auth.id);
    }
    return true;
  }

  Future<bool> checkUser(String userId) async {
    var db = await _getDatabase();
    print("userıd _>" + userId);
    var res = await db
        .query("users", where: "id IN (?) ", whereArgs: [userId.toString()]);
    print(res.length.toString() + "  res length");

    if (res.length != 0)
      return true;
    else
      return false;
  }

  Future<int> addUser(MyUser user) async {
    var db = await _getDatabase();
    // print("added user "+user.id);
    var sonuc = await db.insert("users", user.toJson());

    return sonuc;
  }

  Future<Map<String, dynamic>> getUser(String userId) async {
    var db = await _getDatabase();
    var user = await db
        .query("users", where: "id IN (?) ", whereArgs: [userId.toString()]);
    // var sonuc = await db.insert("not", not.toMap());
    return user[0];
  }
}
