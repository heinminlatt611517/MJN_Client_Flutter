import 'package:MJN/NewViews/NewCreateServiceTicketView.dart';
import 'package:MJN/controllers/checkCanCreateTicketController.dart';
import 'package:MJN/controllers/ticketListController.dart';
import 'package:MJN/models/ticketListVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NewServiceComplainView extends StatefulWidget {
  @override
  _NewServiceComplainViewState createState() => _NewServiceComplainViewState();
}

class _NewServiceComplainViewState extends State<NewServiceComplainView> {
  final TicketListController ticketListController =
      Get.put(TicketListController());

  final CheckCreateTicketController checkCreateTicketController =
      Get.put(CheckCreateTicketController());

  final loginDataStorage = GetStorage();

  int changePageIndex = 0;

  @override
  void initState() {
    super.initState();

    Future.delayed(
        Duration.zero,
        () => ticketListController.fetchTicketList(
            loginDataStorage.read(TOKEN),
            loginDataStorage.read(UID),
            loginDataStorage.read(DATA_TENANT_ID),
            context));
  }

  @override
  Widget build(BuildContext context) {
    return TabScreens.serviceComplainIndex > 0
        ? NewCreateServiceTicketView()
        : Scaffold(
            backgroundColor: Color(0xff188FC5),
            body: Obx(() {
              if (ticketListController.isLoading.value) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (ticketListController.ticketListVo == null) {
                return Center(
                    child: Padding(
                  padding: const EdgeInsets.only(top: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.wifi_off,
                        size: 100,
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Network Error!',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Connect to the internet and try again.',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      RaisedButton(
                          child: Text('Retry'),
                          textColor: Colors.white,
                          color: Colors.grey,
                          onPressed: () {
                            Future.delayed(
                                Duration.zero,
                                () => ticketListController.fetchTicketList(
                                    loginDataStorage.read(TOKEN),
                                    loginDataStorage.read(UID),
                                    loginDataStorage.read(DATA_TENANT_ID),
                                    context));
                          })
                    ],
                  ),
                ));
              } else {
                return SingleChildScrollView(
                    child: Container(
                  margin: EdgeInsets.only(top: 40, bottom: 20),
                  alignment: Alignment.center,
                  child: Column(
                    children: [
                      Obx(() {
                        if (checkCreateTicketController.isLoading.value) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return InkWell(
                              onTap: () {
                                checkCreateTicketController
                                    .checkCanCreateTicket(
                                        loginDataStorage.read(TOKEN),
                                        loginDataStorage.read(DATA_TENANT_ID))
                                    .then((value) => {
                                          if (checkCreateTicketController
                                              .checkCanCreateTicketVo.canCreate)
                                            {
                                              setState(() {
                                                TabScreens
                                                    .serviceComplainIndex = 1;
                                              })
                                            }
                                          else
                                            {
                                              AppUtils.showErrorSnackBar('Fail',
                                                  'Ticket can\'t be created as we are working\nfor your current ticket')
                                            }
                                        });
                              },
                              child: Image(
                                  image: AssetImage(
                                      'assets/images/create_service.png')));
                        }
                      }),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Your Service Ticket',
                        style: TextStyle(color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      _buildServiceTicketTitle(),
                      ticketListController.ticketListVo!.details!.length == 0
                          ? Center(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 50),
                                child: Text(
                                  'There is no tickets...',
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.normal),
                                ),
                              ),
                            )
                          : Container()
                    ],
                  ),
                ));
              }
            }));
  }

  Widget _buildServiceTicketTitle() {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            color: Color(0xffffcc35),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 4, bottom: 4),
                  child: Text(
                    'Ticket ID',
                    style: TextStyle(color: Colors.black, fontSize: 8),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Text(
                    'Ticket\nCreated Date',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 8,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  child: Text(
                    'Service\nRequest',
                    style: TextStyle(color: Colors.black, fontSize: 8),
                    textAlign: TextAlign.center,
                  ),
                ),

                Text(
                  'Status',
                  style: TextStyle(color: Colors.black, fontSize: 8),
                ),
              ],
            ),
          ),
          ListView.builder(
            physics: new NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            reverse: false,
            itemBuilder: (ctx, index) {
              return MyServiceTicketItems(
                  ticketListController.ticketListVo!.details![index]);
            },
            itemCount: ticketListController.ticketListVo!.details!.length,
          )
        ],
      ),
    );
  }

  Widget MyServiceTicketItems(TicketDetail ticketVo) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10, top: 10, bottom: 10),
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    child: InkWell(
                      onTap: () {
                        setState(() {});
                      },
                      child: Text(
                        ticketVo.ticketId,
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        ticketVo.creationDate,
                        style: TextStyle(color: Colors.black, fontSize: 8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                  Container(
                    width: 35,
                    child: Text(
                      ticketVo.serviceRequest.toString(),
                      style: TextStyle(color: Colors.black, fontSize: 8),
                      textAlign: TextAlign.center,
                    ),
                  ),

                  Container(
                    padding: ticketVo.status == 'Closed' ? EdgeInsets.only(right: 5,left: 3) : EdgeInsets.all(0) ,
                    decoration: BoxDecoration(
                      color: ticketVo.status == 'Pending'
                          ? Colors.red
                          : ticketVo.status == 'Closed'
                              ? Colors.deepOrangeAccent
                              : Colors.green,
                      borderRadius: BorderRadius.all(Radius.circular(
                              24.0) //                 <--- border radius here
                          ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Text(
                        ticketVo.status,
                        style: TextStyle(color: Colors.white, fontSize: 8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
