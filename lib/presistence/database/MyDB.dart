// database.dart

// required package imports
import 'dart:async';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/presistence/dao/NotificationDao.dart';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;


part 'MyDB.g.dart';

@Database
  (version: 1, entities: [NotificationModelVO])
abstract class MyDatabase extends FloorDatabase {
  NotificationDao get notiDao;
}