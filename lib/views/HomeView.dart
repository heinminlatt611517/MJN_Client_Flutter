import 'package:MJN/Widgets/current_subscription_items.dart';
import 'package:MJN/Widgets/package_and_service_items.dart';
import 'package:MJN/Widgets/promotion_items.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/AccountDetailView.dart';
import 'package:MJN/views/PackagePlanDetailView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class HomeView extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int changePageIndex = 0;

  //test list
  final List<String> currentPlan = <String>[
    'Aby',
    'Aish',
  ];
  final List<int> endDate = <int>[
    2,
    0,
  ];
  final List<int> startDate = <int>[
    2,
    0,
  ];

  final List<String> promotionNews = <String>[
    'Aby',
    'Aish',
    'Aby',
    'Aish',
  ];

  final List<int> imgList = <int>[2, 0, 10, 6, 6, 6];

  final loginDataStorage = GetStorage();
  double itemHeight = 0;
  double itemWidth = 0;

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    /*24 is for notification bar on Android*/
    itemHeight = (size.height - kToolbarHeight - 24) / 4;
    itemWidth = size.width / 2;

    return changePageIndex == 1
        ? AccountView()
        : changePageIndex == 2
            ? PackagePlanDetailView()
            : Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          color: Colors.blueAccent,
                          width: double.infinity,
                          alignment: Alignment.center,
                          height: 150,
                          child:Center()),
                      NeumorphicButton(
                        margin: EdgeInsets.only(top: 10, left: 10),
                        onPressed: () {
                          setState(() {
                            changePageIndex = 1;
                          });
                        },
                        child: Text(
                          "My Account",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(12)),
                          color: Colors.amber,
                          depth: 8,
//                lightSource: LightSource.topLeft,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8, left: 12),
                        child: Row(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Name',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Building',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  'Unit',
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ':' + loginDataStorage.read(USER_NAME)
                                      ,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  ':' + loginDataStorage.read(BUILDING)
                                      ,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Text(
                                  ':' + loginDataStorage.read(UNIT) ,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 13),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 136,
                          color: Colors.blueAccent,
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 6,
                              bottom: 6,
                            ),
                            child: Text(
                              'currentSubscription'.tr,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 10,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          )),
                      Container(
                        height: 1,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Colors.grey,
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            8.0) //                 <--- border radius here
                                        ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 4, bottom: 4),
                                    child: Text(
                                      'Start date',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  )),
                            ),
                            Container(
                              width: 1,
                              height: 30,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            8.0) //                 <--- border radius here
                                        ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 4, bottom: 4),
                                    child: Text(
                                      'End date',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  )),
                            ),
                            Container(
                              width: 1,
                              height: 30,
                              color: Colors.grey,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blueAccent,
                                    border:
                                        Border.all(color: Colors.blueAccent),
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(
                                            8.0) //                 <--- border radius here
                                        ),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: 8, right: 8, top: 4, bottom: 4),
                                    child: Text(
                                      'Current Plan',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  )),
                            ),
                          ],
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemBuilder: (ctx, index) {
                          return CurrentSubscriptionItems(startDate[index],
                              endDate[index], currentPlan[index]);
                        },
                        itemCount: startDate.length,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        height: 33,
                        margin: EdgeInsets.only(top: 10, left: 10),
                        child: NeumorphicButton(
                          onPressed: () {},
                          child: Text(
                            "Package Plan & Other Service",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                          style: NeumorphicStyle(
                            shape: NeumorphicShape.flat,
                            boxShape: NeumorphicBoxShape.roundRect(
                                BorderRadius.circular(12)),
                            color: Colors.amber,
                            depth: 8,
//                lightSource: LightSource.topLeft,
                          ),
                        ),
                      ),
                      GridView(
                          shrinkWrap: true,
                          physics: new NeverScrollableScrollPhysics(),
                          primary: false,
                          padding: const EdgeInsets.all(10),
                          children: imgList
                              .map((imgData) => PackageAndServiceItems())
                              .toList(),
                          gridDelegate:
                              SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            mainAxisSpacing: 20,
                            crossAxisSpacing: 20,
                            childAspectRatio: (1 / .6),
                          )),
                    ],
                  ),
                ),
              );
  }

  Widget PackageAndServiceItems() {
    return InkWell(
      onTap: () {
        setState(() {
          changePageIndex = 2;
        });
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          borderRadius: BorderRadius.all(
              Radius.circular(24.0) //                 <--- border radius here
              ),
        ),
      ),
    );
  }
}
