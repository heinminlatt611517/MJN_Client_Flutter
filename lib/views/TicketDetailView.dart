import 'package:MJN/controllers/ticketByIdController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/MyServiceTicketView.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TicketDetailView extends StatefulWidget {
 String ticketID;
 TicketDetailView(this.ticketID);
  @override
  _TicketDetailViewState createState() => _TicketDetailViewState();
}

class _TicketDetailViewState extends State<TicketDetailView> {
  int changePageIndex = 0;

  final TicketByIdController ticketByIdController =
  Get.put(TicketByIdController());
  final loginDataStorage = GetStorage();

  @override
  void initState() {
    changePageIndex = 0;
    ticketByIdController.fetchTicketByTicketID(loginDataStorage.read(TOKEN),
        loginDataStorage.read(UID),widget.ticketID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1
        ? MyServiceTicketView()
        : SingleChildScrollView(
      child: Obx(() {
        if (ticketByIdController.isLoading.value) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
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
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.all(18),
                  margin: EdgeInsets.only(left: 10, right: 10),
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(top: 10, bottom: 30),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 20),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text('Username'),
                                  Text('TicketID'),
                                  Text('Service Request'),
                                  Text('Topic'),
                                  Text('Status'),
                                  Text('Message'),
                                  Text('Resolved Time'),
                                  Text('Creation Date'),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 10),
                              child: Column(
                                crossAxisAlignment:
                                CrossAxisAlignment.start,
                                children: [
                                  Text(':' + loginDataStorage.read(USER_NAME)),
                                  Text(':' +
                                      ticketByIdController.ticketVo.details.ticketId ),
                                  Text(':' +
                                      ticketByIdController.ticketVo.details.serviceRequest),
                                  Text(':' +
                                      ticketByIdController.ticketVo.details.topic ),
                                  Text(':' +
                                      ticketByIdController.ticketVo.details.status),
                                  Text(':' +
                                      ticketByIdController.ticketVo.details.message ),
                                  Text(':' +
                                      ticketByIdController.ticketVo.details.resolvedTime ),
                                  Text(':' +
                                      ticketByIdController.ticketVo.details.creationDate ),

                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Container(
                            alignment: Alignment.center,
                            height: 60,
                            margin: EdgeInsets.only(left: 20, right: 20),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                            ),
                            child: Text(
                              'Ticket Detail!!',
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          );
        }
      }),
    );
  }


}
