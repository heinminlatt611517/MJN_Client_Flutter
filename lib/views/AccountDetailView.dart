import 'package:MJN/CustomDialog/EditAccountInfoDialog.dart';
import 'package:MJN/controllers/accountDetailController.dart';
import 'package:MJN/controllers/lastTransactionController.dart';
import 'package:MJN/controllers/loginController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/HomeView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AccountView extends StatefulWidget {
  static const routeName = '/account_screen';

  @override
  _AccountViewState createState() => _AccountViewState();
}

class _AccountViewState extends State<AccountView> {
  int changePageIndex = 0;
  final AccountDetailController accountDetailController =
      Get.put(AccountDetailController());

  final LastTransactionController lastTransactionController =
      Get.put(LastTransactionController());

  final loginDataStorage = GetStorage();

  @override
  void initState() {

    final AccountDetailController accountDetailController =
    Get.put(AccountDetailController());

    changePageIndex = 0;
    accountDetailController.fetchAccountInfoData(loginDataStorage.read(TOKEN),
        loginDataStorage.read(UID), loginDataStorage.read(DATA_TENANT_ID),context);

    lastTransactionController.fetchLastTransactionData(
        loginDataStorage.read(TOKEN),
        loginDataStorage.read(UID),
        loginDataStorage.read(DATA_TENANT_ID));

    super.initState();
  }

  @override
  void didChangeDependencies() {
    refreshData();
    super.didChangeDependencies();
  }

  Future refreshData() async {
    accountDetailController.fetchAccountInfoData(loginDataStorage.read(TOKEN),
        loginDataStorage.read(UID), loginDataStorage.read(DATA_TENANT_ID),context);
  }

  @override
  Widget build(BuildContext context) {

    final AccountDetailController accountDetailController =
    Get.put(AccountDetailController());

    return changePageIndex == 1
        ? HomeView()
        : RefreshIndicator(
            onRefresh: refreshData,
            child: Scaffold(
              body: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Obx(() {
                      if (accountDetailController.isLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      } else {

                        return Column(
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
                              margin: EdgeInsets.only(left: 20, right: 20),
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(color: Colors.grey),
                              ),
                              child: Column(
                                children: [
                                  Container(
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, bottom: 20),
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.white,
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 40,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          color: Colors.grey,
                                          child: Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Text(
                                                'SUBSCRIPTION DETAILS',
                                                textAlign: TextAlign.center,
                                              )),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text('Start date'),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 65),
                                                child: Text(
                                                  '2019-10-15',
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text('End date'),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 73),
                                                child: Text(
                                                  '2019-10-15',
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 4,
                                        ),


                                        Obx(() {
                                          if (lastTransactionController
                                              .isLoading.value) {


                                            return Center(
                                              child:
                                                  CircularProgressIndicator(),
                                            );
                                          } else {
                                            return Column(
                                              children: [
                                                Container(
                                                  height: 40,
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  color: Colors.grey,
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              10),
                                                      child: Text(
                                                        'LAST TRANSACTION DETAILS',
                                                        textAlign:
                                                            TextAlign.center,
                                                      )),
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Transaction ID'),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 38),
                                                        child: Text(
                                                          // lastTransactionController
                                                          //         .transactionVo
                                                          //         .details
                                                          //         .transactionId
                                          ''
                                                             ,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54),
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 1,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Transaction date'),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 24),
                                                        child: Text(
                                                          // lastTransactionController
                                                          //         .transactionVo
                                                          //         .details
                                                          //         .startDate
                                                          ''
                                                              ,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54),
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 1,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Package'),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 74),
                                                        child: Text(
                                                          '2019-10-15',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54),
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 1,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Total'),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 95),
                                                        child: Text(
                                                          // (lastTransactionController
                                                          //             .transactionVo
                                                          //             .details
                                                          //             .paymentTotal
                                                          //         ) +
                                                          //     ' ' +
                                                          //     (lastTransactionController
                                                          //             .transactionVo
                                                          //             .details
                                                          //             .currencyType
                                                          //         )
                                          ''
                                                                  ,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54),
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 1,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Payment'),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 73),
                                                        child: Text(
                                                          // (lastTransactionController
                                                          //             .transactionVo
                                                          //             .details
                                                          //             .paymentTotal
                                                          //         ) +
                                                          //     ' ' +
                                                          //     (lastTransactionController
                                                          //             .transactionVo
                                                          //             .details
                                                          //             .currencyType
                                                          //         )
                                                          ''
                                                          ,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54),
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 1,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text('Paid date'),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 70),
                                                        child: Text(
                                                          // lastTransactionController
                                                          //         .transactionVo
                                                          //         .details
                                                          //         .paidDate
                                          ''
                                                              ,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54),
                                                        )),
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Container(
                                                  width: MediaQuery.of(context)
                                                      .size
                                                      .width,
                                                  height: 1,
                                                  color: Colors.grey,
                                                ),
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Row(
                                                  children: [
                                                    Text(
                                                        'Sales\nrepresentative'),
                                                    Container(
                                                        margin: EdgeInsets.only(
                                                            left: 40),
                                                        child: Text(
                                                          // accountDetailController
                                                          //         .accountInfoVo
                                                          //         .details
                                                          //         .firstname
                                          ''
                                                              ,
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black54),
                                                        )),
                                                  ],
                                                ),
                                              ],
                                            );
                                          }
                                        }),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.white,
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, bottom: 20),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Account Details',
                                              style: TextStyle(
                                                  color:
                                                      Colors.lightBlueAccent),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 4),
                                              width: 120,
                                              height: 35,
                                              child: NeumorphicButton(
                                                onPressed: () {
                                                  showDialog(
                                                      context: context,
                                                      // barrierDismissible: false,
                                                      builder: (BuildContext
                                                          context) {
                                                        return EditAccountInfoDialog();
                                                      });
                                                },
                                                child: Text(
                                                  "Edit Account",
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 12,
                                                      color: Colors.white),
                                                ),
                                                style: NeumorphicStyle(
                                                  shape: NeumorphicShape.flat,
                                                  color: Colors.blue,
                                                  depth: 8,
//                lightSource: LightSource.topLeft,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text('First name'),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 60),
                                                child: Text(
                                                  // accountDetailController
                                                  //     .accountInfoVo
                                                  //     !.details
                                                  //     .firstname
                      ''
                                                  ,
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text('Last name'),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 60),
                                                child: Text(
                                                  // accountDetailController
                                                  //     .accountInfoVo
                                                  //     !.details
                                                  //     .lastname
                                                ''
                                                  ,
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text('User name'),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 60),
                                                child: Text(
                                                  // accountDetailController
                                                  //     .accountInfoVo
                                                  //     !.details
                                                  //     .name
                      ''
                                                  ,
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                )),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 1,
                                          color: Colors.grey,
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    color: Colors.white,
                                    padding: EdgeInsets.only(
                                        left: 20, right: 20, bottom: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Text(
                                          'Contact Information',
                                          style: TextStyle(
                                              color: Colors.lightBlueAccent),
                                        ),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          children: [
                                            Text('Email'),
                                            Container(
                                                margin:
                                                    EdgeInsets.only(left: 90),
                                                child: Text(

                                                  // accountDetailController
                                                  //     .accountInfoVo
                                                  //     .details
                                                  //     .mail
                      ''
                                                  ,
                                                  style: TextStyle(
                                                      color: Colors.black54),
                                                )),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        );
                      }
                    })),
              ),
            ),
          );
  }
}
