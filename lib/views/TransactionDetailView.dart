import 'package:MJN/controllers/transactionController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/PaymentView.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class TransactionDetailView extends StatefulWidget {
  String transactionID;

  TransactionDetailView(this.transactionID);

  @override
  _TransactionDetailViewState createState() => _TransactionDetailViewState();
}

class _TransactionDetailViewState extends State<TransactionDetailView> {
  int changePageIndex = 0;

  final TransactionController transactionController =
      Get.put(TransactionController());
  final langStorage = GetStorage();

  @override
  void initState() {
    changePageIndex = 0;
    transactionController.fetchTransactionDataByID(
        langStorage.read(TOKEN), langStorage.read(UID), widget.transactionID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1
        ? PaymentView()
        : SingleChildScrollView(
            child: Obx(() {
              if (transactionController.isLoading.value) {
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
                        margin: EdgeInsets.only(left: 20, right: 20),
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
                                    padding: const EdgeInsets.only(right: 40),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text('Username'),
                                        Text('Invoice No'),
                                        Text('Package'),
                                        Text('Start Date'),
                                        Text('End Date'),
                                        Text('Paid Date'),
                                        Text('Amount'),
                                        Text('5%'),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(':' + langStorage.read(USER_NAME)),
                                        Text(':' +
                                                transactionController
                                                    .transactionVo
                                                    .details
                                                    !.transactionId ??
                                            'null'),
                                        Text(': 10 Mbps'),
                                        Text(':' +
                                                transactionController
                                                    .transactionVo
                                                    .details
                                                    !.startDate ??
                                            'null'),
                                        Text(':'),
                                        Text(':' +
                                                transactionController
                                                    .transactionVo
                                                    .details
                                                    !.endDate ??
                                            'null'),
                                        Text(':' +
                                                transactionController
                                                    .transactionVo
                                                    .details
                                                    !.paidDate ??
                                            'null'),
                                        Text(': 2500 MMK'),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                margin: EdgeInsets.only(left: 50, right: 60),
                                height: 1,
                                width: MediaQuery.of(context).size.width,
                                color: Colors.grey,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(right: 70),
                                    child: Text('Total Due'),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 30),
                                    child: Text(':' +
                                        transactionController
                                            .transactionVo.details!.paymentTotal +
                                        ' ' +
                                        transactionController
                                            .transactionVo.details!.currencyType),
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
                                    'Thank you for your payment!!',
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
