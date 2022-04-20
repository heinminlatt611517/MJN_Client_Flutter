import 'package:MJN/Widgets/my_sevice_ticket_items.dart';
import 'package:MJN/controllers/ticketListController.dart';
import 'package:MJN/models/ticketListVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/ServiceComplainView.dart';
import 'package:MJN/views/TicketDetailView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyServiceTicketView extends StatefulWidget {
  @override
  _MyServiceTicketViewState createState() => _MyServiceTicketViewState();
}

class _MyServiceTicketViewState extends State<MyServiceTicketView> {
  int changePageIndex = 0;
  late String currentTicketIndex;

  final TicketListController ticketListController =
      Get.put(TicketListController());
  final loginDataStorage = GetStorage();

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ticketListController.fetchTicketList(loginDataStorage.read(TOKEN),
        loginDataStorage.read(UID), loginDataStorage.read(DATA_TENANT_ID),context);

    return changePageIndex == 1
        ? ServiceComplainView()
        : changePageIndex == 2
            ? TicketDetailView(currentTicketIndex)
            : Scaffold(
                body: SingleChildScrollView(
                  child: Obx(() {
                    if (ticketListController.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    changePageIndex = 1;
                                  });
                                },
                                child: Container(
                                    alignment: Alignment.centerLeft,
                                    child: Icon(
                                      Icons.keyboard_backspace_sharp,
                                      size: 40,
                                    ))),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              height: 40,
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 3, left: 10),
                              child: NeumorphicButton(
                                onPressed: () {},
                                child: Text(
                                  "My Service Ticket",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.white),
                                ),
                                style: NeumorphicStyle(
                                  shape: NeumorphicShape.flat,
                                  boxShape: NeumorphicBoxShape.roundRect(
                                      BorderRadius.circular(14)),
                                  color: Colors.blue,
                                  depth: 8,
//                lightSource: LightSource.topLeft,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              height: 1,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                              ),
                            ),
                            Container(
                              height: 45,
                              color: Colors.grey,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4, top: 4, bottom: 4),
                                    child: Text(
                                      'Ticket ID',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8),
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 45,
                                    color: Colors.black,
                                  ),
                                  Text(
                                    'Ticket\nCreated Date',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 8,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    width: 1,
                                    height: 45,
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4, top: 4, bottom: 4),
                                    child: Text(
                                      'Service\nRequest',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 45,
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 4, right: 4, top: 4, bottom: 4),
                                    child: Text(
                                      'Issue',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8),
                                    ),
                                  ),
                                  Container(
                                    width: 1,
                                    height: 45,
                                    color: Colors.black,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        left: 5, right: 4, top: 4, bottom: 4),
                                    child: Text(
                                      'Status',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 8),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            ListView.builder(
                              physics: new NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (ctx, index) {
                                return MyServiceTicketItems(ticketListController
                                    .ticketListVo!.details![index]);
                              },
                              itemCount: ticketListController
                                  .ticketListVo!.details!.length,
                            )
                          ],
                        ),
                      );
                    }
                  }),
                ),
              );
  }

  // ignore: non_constant_identifier_names
  Widget MyServiceTicketItems(TicketDetail ticketDetailVO) {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.black),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: 41,
            child: InkWell(
              onTap: () {
                setState(() {
                  currentTicketIndex = ticketDetailVO.ticketId;
                  changePageIndex = 2;
                });
              },
              child: Text(
                ticketDetailVO.ticketId ,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 8,
                  decoration: TextDecoration.underline,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ),
          Container(
            width: 1,
            height: 45,
            color: Colors.black,
          ),
          Container(
            width: 50,
            child: Text(
              ticketDetailVO.creationDate,
              style: TextStyle(color: Colors.black, fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 1,
            height: 45,
            color: Colors.black,
          ),
          Container(
            width: 40,
            child: Text(
              ticketDetailVO.serviceRequest ?? '' ,
              style: TextStyle(color: Colors.black, fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 1,
            height: 45,
            color: Colors.black,
          ),
          Container(
            width: 30,
            child: Text(
              'ticketDetailVO.serviceRequestOther',
              style: TextStyle(color: Colors.black, fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),
          Container(
            width: 1,
            height: 45,
            color: Colors.black,
          ),
          Container(
            width: 34,
            child: Text(
              ticketDetailVO.status ,
              style: TextStyle(color: Colors.black, fontSize: 8),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
