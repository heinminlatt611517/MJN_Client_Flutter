
import 'dart:async';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DatabaseUtil {
  factory DatabaseUtil() {
    return _databaseUtil;
  }

  DatabaseUtil._internal();

  static final DatabaseUtil _databaseUtil = DatabaseUtil._internal();

  Database? databaseRef = null;

  Future<Database> InitDatabase() async {
    print("InitDatabase");

    Future<Database> _fDb = openDatabase(
      join(await getDatabasesPath(), 'mjn_database.db'),
      onCreate: (db, version) {
        return db.execute(
        'CREATE TABLE notifications(id INTEGER PRIMARY KEY, title TEXT, body TEXT, message TEXT, type_name TEXT, action_url TEXT, created TEXT)',
        );
      },
      // Set the version. This executes the onCreate function and provides a
      // path to perform database upgrades and downgrades.
      version: 1,
    );

    _fDb.then((value) {
      databaseRef = value;
    });

    return _fDb;

  }

  Future<void> insertNotification(NotificationModelVO notiModel) async {
    print("insertNotification");
    if(databaseRef != null) {
      print("adding into DB");
      await databaseRef!.insert(
        'notifications',
        notiModel.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

  }

  Future<List<NotificationModelVO>?> getAllNotiModels() async {
    if(databaseRef != null) {
      // Query the table for all notifications.
      final List<Map<String, dynamic>> maps = await databaseRef!.query('notifications');

      return List.generate(maps.length, (i) {
        return NotificationModelVO.fromJson(maps[i]);
      });
    }
   return null;
  }

}