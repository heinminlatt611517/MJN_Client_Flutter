import 'package:MJN/Widgets/notification_items.dart';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/presistence/db/database_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';

class NotificationView extends StatefulWidget {
  static const routeName = '/notification_screen';
  @override
  _NotificationViewState createState() => _NotificationViewState();
}

class _NotificationViewState extends State<NotificationView> {

  List<NotificationModelVO> notificationLists = <NotificationModelVO>[];
  bool bDataRetrievedLately = false;

  final _controller = ScrollController();
  final _height = 100.0;

  void retrieveNotiFromDatabase() {
    Future<List<NotificationModelVO>?> notimodels = DatabaseUtil().getAllNotiModels();
    notimodels.then((value) {
      notificationLists = value!;
      setState(() {
        bDataRetrievedLately = true;
      });
      print(notificationLists.length);

    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      retrieveNotiFromDatabase();
    }
  }


  @override
  Widget build(BuildContext context) {
    retrieveNotiFromDatabase();

    if(bDataRetrievedLately && notificationLists != null) {

      bDataRetrievedLately = false;

      return Scaffold(
        body:
           SingleChildScrollView(
             child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 40,
                  alignment: Alignment.centerLeft,
                  margin: EdgeInsets.only(top: 10, left: 27),
                  child: NeumorphicButton(
                    onPressed: () {},
                    child: Text(
                      "Notifications",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Colors.white),
                    ),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape:
                      NeumorphicBoxShape.roundRect(BorderRadius.circular(14)),
                      color: Colors.blue,
                      depth: 8,
//                lightSource: LightSource.topLeft,
                    ),
                  ),
                ),

                SizedBox(
                  height: 20,
                ),

                ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (ctx, index) {

                    return NotificationItems(notificationLists[index].body);
                  },
                  itemCount: notificationLists.length,
                ),

              ],
          ),
           ),
      );
    }
    else {
      return Container();
    }

  }
}
