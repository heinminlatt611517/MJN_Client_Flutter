import 'dart:convert';

import 'package:MJN/main.dart';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;


class NotificationService {

  void cancelNotification(NotificationModelVO birthday) async {
    await flutterLocalNotificationsPlugin.cancel(birthday.hashCode);
  }


  void handleApplicationWasLaunchedFromNotification() async {
    final NotificationAppLaunchDetails? notificationAppLaunchDetails =
    await flutterLocalNotificationsPlugin.getNotificationAppLaunchDetails();

    if (notificationAppLaunchDetails!.didNotificationLaunchApp) {
      NotificationModelVO notiModel = getNotificationModelFromPayload(notificationAppLaunchDetails.payload);
      cancelNotification(notiModel);

    }
  }

  NotificationModelVO getNotificationModelFromPayload(String? payload) {
    Map<String, dynamic> json = jsonDecode(payload!);
    NotificationModelVO notiModel = NotificationModelVO.fromJson(json);

    return notiModel;
  }

}
