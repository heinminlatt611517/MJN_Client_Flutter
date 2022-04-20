import 'dart:async';
import 'package:MJN/NewViews/UnreadNotificationView.dart';
import 'package:MJN/Widgets/new_notification_items.dart';
import 'package:MJN/models/notificationCountNotifier.dart';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/presistence/dao/NotificationDao.dart';
import 'package:MJN/presistence/database/MyAppDatabase.dart';
import 'package:MJN/presistence/database/MyDB.dart';
import 'package:MJN/utils/eventbus_util.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_storage/get_storage.dart';

class NewNotificationView extends StatefulWidget {
  static const routeName = '/notification_screen';
  late final NotificationDao notificationDao;

  NewNotificationView(this.notificationDao);

  @override
  _NewNotificationViewState createState() => _NewNotificationViewState();
}

class _NewNotificationViewState extends State<NewNotificationView> with WidgetsBindingObserver {
  late MyDatabase? database;


  late StreamSubscription notiSub;

  late StreamSubscription notiUpdate;

  final langStorage = GetStorage();

  final updateNotify = NotificationCountNotifier();

  bool isReadMore = false;

  var searchTextController = TextEditingController();

  List<NotificationModelVO> notificationLists = <NotificationModelVO>[];
  bool bDataRetrievedLately = false;
  String _value = "";
  var notiCount = 0.obs;

  final List<String> notilists = <String>[
    'Aby',
    'Aish',
    'Aby',
    'Aish',
  ];

  Future<NotificationDao> builder() async {
    database = await MyAppDatabase.instance.database;

    widget.notificationDao = database!.notiDao;
    return widget.notificationDao;
  }

  bool isExpanded = false;

  String text =
      "Flutter has its own UI components, along with an engine to render them on both the Android and iOS platforms. Most of those UI components, right out of the box, conform to the guidelines of Material Design.";

  Future<List<NotificationModelVO>> retrieveUsers() async {
    return await widget.notificationDao.fetchAllNotifications();
  }

  Future<List<NotificationModelVO>> retrieveAllUnreadNotifications() async {
    return await widget.notificationDao.fetchUnreadNotifications();
  }

  @override
  void dispose() {
    WidgetsBinding.instance!.removeObserver(this);
    super.dispose();
  }


  @override
  void initState() {
    WidgetsBinding.instance!.addObserver(this);
    print('Noti init state');

    retrieveUsers().then((value) {
      notificationLists = value;
      setState(() {});
    });

    notiSub = EventBusUtils.getInstance().on().listen((event) {
      if (event.toString() == 'Update')
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          setState(() {
            // retrieveUsers().then((value) {
            //   notificationLists = value;
            // });
            retrieveAllUnreadNotifications()
                .then((value) => {notiCount.value = value.length});
          });
        });
    });

    notiSub =
        EventBusUtils.getInstance().on<NotificationModelVO>().listen((event) {
      print("NOTI EVENT INIT " + event.title);

        //notificationLists.add(event);
        retrieveUsers().then((value) {
          notificationLists = value;
          setState(() {
          });
        });

      retrieveAllUnreadNotifications()
          .then((value) => {notiCount.value = value.length});

     // setState(() {});
    });

    retrieveAllUnreadNotifications()
        .then((value) => {notiCount.value = value.length});

    super.initState();
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {

    print('LifeCycleState'+state.toString());

    notiSub =
        EventBusUtils.getInstance().on<NotificationModelVO>().listen((event) {
      print("NOTI EVENT LifeCycle" + event.title);

      notificationLists.add(event);

      retrieveAllUnreadNotifications()
          .then((value) => {notiCount.value = value.length});
    });

    notiSub = EventBusUtils.getInstance().on().listen((event) {
      if (event.toString() == 'Update')
        WidgetsBinding.instance!.addPostFrameCallback((_) {
          setState(() {
            // retrieveUsers().then((value) {
            //   notificationLists = value;
            // });

            retrieveAllUnreadNotifications()
                .then((value) => {notiCount.value = value.length});
          });
        });
    });
  }

  void retrieveUpdateNotifications(int value) {
    debugPrint("Click");
   setState(() {
      retrieveUsers().then((value) {
        notificationLists = value;
      });

      retrieveAllUnreadNotifications()
          .then((value)  {
            debugPrint("Click ${value.length}");
            Future.delayed(Duration(seconds: 1),(){
              notiCount.value = value.length;
            });
          });
    });
  }

  @override
  Widget build(BuildContext context) {
    retrieveUsers().then((value) {
      notificationLists = value;
    });
    return TabScreens.notificationPageIndex > 0
        ? UnreadNotificationView()
        : Scaffold(
            backgroundColor: Color(0xff188FC5),
            body: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SingleChildScrollView(
                child: Container(
                  margin: EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Obx(() {
                        return Text(
                          "${notiCount.value} Unread Messages",
                          style: TextStyle(color: Colors.white),
                        );
                      }),
                      Container(
                        width: 67,
                        height: 30,
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(
                          top: 10,
                        ),
                        child: NeumorphicButton(
                          onPressed: () {
                            retrieveAllUnreadNotifications().then((value) => {
                                  if (value.length > 0)
                                    {
                                      setState(() {
                                        TabScreens.notificationPageIndex = 1;
                                      })
                                    }
                                });
                          },
                          child: Text(
                            "View",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 10,
                                color: Color(0xff188FC5)),
                          ),
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(8)),
                            color: Colors.white,
                            depth: -8,
//                lightSource: LightSource.topLeft,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              height: 40,
                              padding: EdgeInsets.only(bottom: 6),
                              child: TextField(
                                controller: searchTextController,
                                textAlign: TextAlign.center,
                                onChanged: (String value) {
                                  if (value.length <= 0) {
                                    retrieveUsers().then((value) {
                                      notificationLists = value;
                                      setState(() {});
                                    });
                                  }
                                },
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          InkWell(
                            onTap: () {
                              setState(() {
                                if (searchTextController.value.text != '') {
                                  notificationLists = notificationLists
                                      .where((element) => element.title
                                          .toLowerCase()
                                          .contains(
                                              searchTextController.value.text))
                                      .toList();
                                }
                              });
                            },
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 35,
                            ),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          PopupMenuButton(
                              icon: Padding(
                                padding: const EdgeInsets.only(left: 5),
                                child: Icon(
                                  Icons.more_vert,
                                  color: Colors.white,
                                  size: 25,
                                ),
                              ),
                              elevation: 20,
                              enabled: true,
                              onSelected: (value) {
                                setState(() {
                                  _value = value.toString();
                                });
                                if (_value == 'one') {
                                  widget.notificationDao
                                      .markAllNotifications()
                                      .then((value) => {
                                            EventBusUtils.getInstance()
                                                .fire('MarkAll'),
                                          });
                                  widget.notificationDao
                                      .fetchUnreadNotifications()
                                      .then((value) =>
                                          {notiCount.value = value.length});

                                  widget.notificationDao
                                      .fetchAllNotifications()
                                      .then((value) => {
                                            setState(() {
                                              notificationLists = value;
                                            })
                                          });
                                } else if (_value == 'two') {
                                  widget.notificationDao
                                      .deleteAllNotifications()
                                      .then((value) => {
                                            setState(() {
                                              notificationLists.clear();

                                              EventBusUtils.getInstance()
                                                  .fire('DeleteAll');
                                              retrieveAllUnreadNotifications()
                                                  .then((value) => {
                                                        notiCount.value =
                                                            value.length,
                                                      });
                                            })
                                          });
                                }
                              },
                              itemBuilder: (context) => [
                                    PopupMenuItem(
                                      child: Text("Mark all as read"),
                                      value: "one",
                                    ),
                                    PopupMenuItem(
                                      child: Text("Delete all"),
                                      value: "two",
                                    ),
                                  ])
                        ],
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: NeverScrollableScrollPhysics(),
                        itemBuilder: (ctx, index) {
                          return NewNotificationItems(
                              'typeAll',
                              text,
                              notificationLists[index],
                              (value){
                                retrieveUpdateNotifications(value);
                              });
                        },
                        itemCount: notificationLists.length,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
