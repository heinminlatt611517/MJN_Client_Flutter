import 'package:MJN/Widgets/new_notification_items.dart';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/presistence/database/MyAppDatabase.dart';
import 'package:flutter/material.dart';

class UnreadNotificationView extends StatefulWidget {
  @override
  _UnreadNotificationViewState createState() => _UnreadNotificationViewState();
}

class _UnreadNotificationViewState extends State<UnreadNotificationView> {
  List<NotificationModelVO> notificationLists = <NotificationModelVO>[];

  String text =
      "unread";

  @override
  void initState() {
    MyAppDatabase.notificationDao!.fetchUnreadNotifications().then((value) => {
          if (value.length > 0)
            {
              setState(() {
                notificationLists = value;
              })
            }
        });

    super.initState();
  }

  void doNothing(){}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff188FC5),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(20),
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (ctx, index) {
              return NewNotificationItems(
                  'typeUnread',text, notificationLists[index],(value){
              });
            },
            itemCount: notificationLists.length,
          ),
        ),
      ),
    );
  }
}
