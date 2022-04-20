import 'package:MJN/models/notificationCountNotifier.dart';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/presistence/database/MyAppDatabase.dart';
import 'package:MJN/utils/eventbus_util.dart';
import 'package:flutter/material.dart';
typedef NotiUpdate(int);
class NewNotificationItems extends StatefulWidget {
  String type;
  String text;
  NotificationModelVO notificationList;
 // final Function notiupdate;
  NotiUpdate? notiUpdate;

  NewNotificationItems(this.type,this.text, this.notificationList,this.notiUpdate);

  @override
  _NewNotificationItemsState createState() => _NewNotificationItemsState();
}

class _NewNotificationItemsState extends State<NewNotificationItems> {
  final updateNotify = NotificationCountNotifier();
  bool isReadMore = false;
  int readStatus = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      padding: EdgeInsets.all(12),
      color: Colors.white,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              //Image(image: AssetImage('assets/images/outage_icon.png')),
              Image.network(
                widget.notificationList.imageUrl,
                height: 50,
              ),
              Container(
                height: 40,
                width: 2,
                color: Colors.grey,
              ),

              Container(
                width: 180,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.notificationList.created,
                      style: TextStyle(
                        fontSize: 8,
                        color: Colors.grey,
                      ),
                      textAlign: TextAlign.left,
                    ),
                    InkWell(
                        onTap: () {
                          print("UPdate");
                          NotificationModelVO notification =
                              new NotificationModelVO(
                                  widget.notificationList.id,
                                  widget.notificationList.title,
                                  widget.notificationList.body,
                                  widget.notificationList.message,
                                  widget.notificationList.type_name,
                                  widget.notificationList.action_url,
                                  widget.notificationList.created,
                                  widget.notificationList.imageUrl,
                                  read: 1);

                          //widget.notificationDao.updateNotification(notification);

                          MyAppDatabase.notificationDao!
                              .updateNotification(notification)
                              .then((value) => {
                                    EventBusUtils.getInstance().fire('Update'),
                                   print("UPdate1"),
                                    widget.notiUpdate!(1)
                                  });

                          setState(() {
                            isReadMore = true;
                            readStatus =1;
                          });

                        },
                        child: Text(
                          widget.notificationList.title,
                          style: TextStyle(fontSize: 14, color: Colors.black),
                        )),
                  ],
                ),
              ),
              widget.notificationList.read == 1
                  ? Container()
                  : (widget.type == 'typeUnread'  && readStatus == 1  )
                  ? Container()
                  : Icon(
                      Icons.circle,
                      color: Colors.red,
                      size: 8,
                    )
            ],
          ),
          isReadMore
              ? Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    widget.notificationList.message,
                    style: TextStyle(fontSize: 14, color: Colors.black),
                  ),
                )
              : Container(),
          isReadMore
              ? Container(
                  alignment: Alignment.centerRight,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        print("read Update");
                        isReadMore = !isReadMore;
                      });

                    },
                    child: Text(
                      'show less',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xff188FC5),
                      ),
                      textAlign: TextAlign.end,
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
