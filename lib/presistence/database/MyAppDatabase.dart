import 'package:MJN/presistence/dao/NotificationDao.dart';

import 'MyDB.dart';

class MyAppDatabase {

  MyAppDatabase._privateConstructor();
  static final MyAppDatabase instance = MyAppDatabase._privateConstructor();
  static  NotificationDao? notificationDao;
  static MyDatabase? _database;
  Future<MyDatabase?> get database async{
    if(_database !=null){
      return _database;
    }
    _database = await _initDatabase();
    return _database;
  }

  _initDatabase() async{
    return await $FloorMyDatabase
        .databaseBuilder('app_database.db')
        .build();
  }

 static Future<NotificationDao> builder() async {
   var database = await MyAppDatabase.instance.database;
    return database!.notiDao;
  }

}