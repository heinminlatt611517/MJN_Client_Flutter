import 'package:MJN/models/notificationModelVO.dart';
import 'package:floor/floor.dart';

@dao
abstract class NotificationDao {

  @insert
  Future<void> insertNotification(NotificationModelVO notification);

  @Query('DELETE FROM notification')
  Future<void> deleteAllNotifications();

  @Query('SELECT * FROM notification')
  Future<List<NotificationModelVO>> fetchAllNotifications();

  @Query('SELECT * FROM notification WHERE read = 0 ')
  Future<List<NotificationModelVO>> fetchUnreadNotifications();

  @update
  Future<void> updateNotification(NotificationModelVO notification);

  @Query('UPDATE notification SET read = 1')
  Future<void> markAllNotifications();
}