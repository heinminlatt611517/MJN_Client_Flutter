import 'package:MJN/controllers/accountDetailController.dart';
import 'package:MJN/controllers/lastTransactionController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class MyAccountView extends StatefulWidget {
  @override
  _MyAccountViewState createState() => _MyAccountViewState();
}

class _MyAccountViewState extends State<MyAccountView> {
  final AccountDetailController accountDetailController =
      Get.put(AccountDetailController());

  final LastTransactionController lastTransactionController =
      Get.put(LastTransactionController());

  final loginDataStorage = GetStorage();

  @override
  void initState() {
    final LastTransactionController lastTransactionController =
    Get.put(LastTransactionController());
    super.initState();

    Future.delayed(
        Duration.zero,
        () => accountDetailController
            .fetchAccountInfoData(
                loginDataStorage.read(TOKEN),
                loginDataStorage.read(UID),
                loginDataStorage.read(DATA_TENANT_ID),
                context)
            .then((value) => {
                  lastTransactionController.fetchLastTransactionData(
                      loginDataStorage.read(TOKEN),
                      loginDataStorage.read(UID),
                      loginDataStorage.read(DATA_TENANT_ID))
                }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff188FC5),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.all(30.0),
          child: Column(
            children: [
              _buildAccountDetailView(),
              _buildTransactionDetailView(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAccountDetailView() {
    return Obx(() {
      if (accountDetailController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (accountDetailController.accountInfoVo == null) {
        return Center(
            child: Container(
          margin: EdgeInsets.only(top: 100),
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
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'Connect to the internet and try again.',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
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
                        () => accountDetailController
                            .fetchAccountInfoData(
                                loginDataStorage.read(TOKEN),
                                loginDataStorage.read(UID),
                                loginDataStorage.read(DATA_TENANT_ID),
                                context)
                            .then((value) => {
                                  lastTransactionController
                                      .fetchLastTransactionData(
                                          loginDataStorage.read(TOKEN),
                                          loginDataStorage.read(UID),
                                          loginDataStorage.read(DATA_TENANT_ID))
                                }));
                  })
            ],
          ),
        ));
      } else {
        return Container(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, top: 12, right: 40, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Account Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xffe9e9e9)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Name',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xffe9e9e9)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Email',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xffe9e9e9)),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'User Name',
                          style:
                              TextStyle(fontSize: 14, color: Color(0xffe9e9e9)),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            ': ${accountDetailController.accountInfoVo!.details!.firstname}',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text(
                            ': ${accountDetailController.accountInfoVo!.details!.mail}',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Container(
                          child: Text(
                            ': ${accountDetailController.accountInfoVo!.details!.name}',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Color(0xffe9e9e9),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Payment Subscription Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xffe9e9e9)),
                ),
                SizedBox(
                  height: 15,
                ),
               Obx((){
                 if(lastTransactionController.isLoading.value){

                   return Center(child: CircularProgressIndicator());
                 }
                 else {
                   return Row(
                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         children: [
                           Text(
                             'Start date',
                             style:
                             TextStyle(fontSize: 14, color: Color(0xffe9e9e9)),
                           ),
                           SizedBox(
                             height: 15,
                           ),
                           Text(
                             'End date',
                             style:
                             TextStyle(fontSize: 14, color: Color(0xffe9e9e9)),
                           ),
                         ],
                       ),
                       Padding(
                         padding: const EdgeInsets.only(right: 30),
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           children: [
                             Container(
                               child: Text(
                                 ': ${lastTransactionController.transactionVo!.details!.startDate}',
                                 style: TextStyle(
                                     fontSize: 14, color: Color(0xffe9e9e9)),
                               ),
                             ),
                             SizedBox(
                               height: 15,
                             ),
                             Container(
                               child: Text(
                                 ': ${lastTransactionController.transactionVo!.details!.endDate}',
                                 style: TextStyle(
                                     fontSize: 14, color: Color(0xffe9e9e9)),
                               ),
                             ),
                           ],
                         ),
                       ),
                     ],
                   );
                 }
               })
              ],
            ),
          ),
        );
      }
    });
  }

  Widget _buildTransactionDetailView() {
    return Obx(() {
      if (lastTransactionController.isLoading.value) {
        return Container();
      } else if (lastTransactionController.transactionVo!.details != null) {
        return Container(
          child: Padding(
            padding:
                const EdgeInsets.only(left: 12, top: 12, right: 40, bottom: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Color(0xffe9e9e9),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Last Payment Transaction Details',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xffe9e9e9)),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Transaction ID',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Transaction Date',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Package',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Total',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Payment',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Paid date',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            'Sales representative',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ':  ${lastTransactionController.transactionVo!.details!.transactionId}',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            ':  ${lastTransactionController.transactionVo!.details!.creationDate}',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            ':  20Mbps',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            ': ${(lastTransactionController.transactionVo!.details!.paymentTotal) + ' ' + (lastTransactionController.transactionVo!.details!.currencyType)}',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            ': ${(lastTransactionController.transactionVo!.details!.paymentTotal) + ' ' + (lastTransactionController.transactionVo!.details!.currencyType)}',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            ':  ${lastTransactionController.transactionVo!.details!.creationDate}',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Text(
                            ': Win Htut Oo',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                        ],
                      ),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 1,
                  color: Color(0xffe9e9e9),
                ),
              ],
            ),
          ),
        );
      } else {
        return Container();
      }
    });
  }
}
