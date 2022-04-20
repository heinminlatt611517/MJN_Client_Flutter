// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MyDB.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

// ignore: avoid_classes_with_only_static_members
class $FloorMyDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MyDatabaseBuilder databaseBuilder(String name) =>
      _$MyDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static _$MyDatabaseBuilder inMemoryDatabaseBuilder() =>
      _$MyDatabaseBuilder(null);
}

class _$MyDatabaseBuilder {
  _$MyDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  /// Adds migrations to the builder.
  _$MyDatabaseBuilder addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  /// Adds a database [Callback] to the builder.
  _$MyDatabaseBuilder addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  /// Creates the database and initializes it.
  Future<MyDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$MyDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$MyDatabase extends MyDatabase {
  _$MyDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  NotificationDao? _notiDaoInstance;

  Future<sqflite.Database> open(String path, List<Migration> migrations,
      [Callback? callback]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `notification` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `title` TEXT NOT NULL, `read` INTEGER, `body` TEXT NOT NULL, `message` TEXT NOT NULL, `type_name` TEXT NOT NULL, `action_url` TEXT NOT NULL, `created` TEXT NOT NULL, `imageUrl` TEXT NOT NULL)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  NotificationDao get notiDao {
    return _notiDaoInstance ??= _$NotificationDao(database, changeListener);
  }
}

class _$NotificationDao extends NotificationDao {
  _$NotificationDao(this.database, this.changeListener)
      : _queryAdapter = QueryAdapter(database),
        _notificationModelVOInsertionAdapter = InsertionAdapter(
            database,
            'notification',
            (NotificationModelVO item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'read': item.read,
                  'body': item.body,
                  'message': item.message,
                  'type_name': item.type_name,
                  'action_url': item.action_url,
                  'created': item.created,
                  'imageUrl': item.imageUrl
                }),
        _notificationModelVOUpdateAdapter = UpdateAdapter(
            database,
            'notification',
            ['id'],
            (NotificationModelVO item) => <String, Object?>{
                  'id': item.id,
                  'title': item.title,
                  'read': item.read,
                  'body': item.body,
                  'message': item.message,
                  'type_name': item.type_name,
                  'action_url': item.action_url,
                  'created': item.created,
                  'imageUrl': item.imageUrl
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<NotificationModelVO>
      _notificationModelVOInsertionAdapter;

  final UpdateAdapter<NotificationModelVO> _notificationModelVOUpdateAdapter;

  @override
  Future<void> deleteAllNotifications() async {
    await _queryAdapter.queryNoReturn('DELETE FROM notification');
  }

  @override
  Future<List<NotificationModelVO>> fetchAllNotifications() async {
    return _queryAdapter.queryList('SELECT * FROM notification',
        mapper: (Map<String, Object?> row) => NotificationModelVO(
            row['id'] as int?,
            row['title'] as String,
            row['body'] as String,
            row['message'] as String,
            row['type_name'] as String,
            row['action_url'] as String,
            row['created'] as String,
            row['imageUrl'] as String,
            read: row['read'] as int?));
  }

  @override
  Future<List<NotificationModelVO>> fetchUnreadNotifications() async {
    return _queryAdapter.queryList('SELECT * FROM notification WHERE read = 0',
        mapper: (Map<String, Object?> row) => NotificationModelVO(
            row['id'] as int?,
            row['title'] as String,
            row['body'] as String,
            row['message'] as String,
            row['type_name'] as String,
            row['action_url'] as String,
            row['created'] as String,
            row['imageUrl'] as String,
            read: row['read'] as int?));
  }

  @override
  Future<void> markAllNotifications() async {
    await _queryAdapter.queryNoReturn('UPDATE notification SET read = 1');
  }

  @override
  Future<void> insertNotification(NotificationModelVO notification) async {
    await _notificationModelVOInsertionAdapter.insert(
        notification, OnConflictStrategy.abort);
  }

  @override
  Future<void> updateNotification(NotificationModelVO notification) async {
    await _notificationModelVOUpdateAdapter.update(
        notification, OnConflictStrategy.abort);
  }
}
