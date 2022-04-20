import 'package:MJN/NewViews/PaymentInvoiceView.dart';
import 'package:MJN/controllers/invoiceListController.dart';
import 'package:MJN/models/invoiceListVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class NewPaymentView extends StatefulWidget {
  @override
  _NewPaymentViewState createState() => _NewPaymentViewState();
}

class _NewPaymentViewState extends State<NewPaymentView> {
  final InvoiceListController invoiceListController =
      Get.put(InvoiceListController());

  int changePageIndex = 0;
  int paymentStatusIndex = 0;

  final loginDataStorage = GetStorage();
  late String currentInvoiceIndex;

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();

    Future.delayed(
        Duration.zero,
        () => invoiceListController.fetchPaymentInvoiceList(
            loginDataStorage.read(TOKEN),
            loginDataStorage.read(UID),
            loginDataStorage.read(DATA_TENANT_ID),
            context));
  }

  @override
  Widget build(BuildContext context) {
    print("Payment Status" + paymentStatusIndex.toString());
    String paymentStatus = paymentStatusIndex == 1
        ? 'Unpaid'
        : paymentStatusIndex == 2
            ? 'Paid'
            : '';
    paymentStatusIndex = 1; // set initial value
    return TabScreens.onlinePaymentIndex > 1
        ? PaymentInvoiceView(paymentStatus, currentInvoiceIndex)
        : Scaffold(
            backgroundColor: Color(0xff188FC5),
            body: SingleChildScrollView(
              child: Container(
                  padding: EdgeInsets.only(bottom: 25),
                  alignment: Alignment.center,
                  child: Obx(() {
                    if (invoiceListController.isLoading.value) {
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    } else {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'Unpaid',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xffe9e9e9)),
                            ),
                          ),
                          _buildPaymentStatusUnpaidTitle(),
                          Padding(
                            padding: const EdgeInsets.only(top: 20),
                            child: Text(
                              'Paid',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xffe9e9e9)),
                            ),
                          ),
                          _buildPaymentStatusPaidTitle()
                        ],
                      );
                    }
                  })),
            ),
          );
  }

  Widget _buildPaymentStatusUnpaidTitle() {
    int totalUnpaidAmount = 0;

    List<Detail> unPaidLists = invoiceListController
        .invoiceListVo.details!
        .where((element) => element.paymentStatus == 'Unpaid')
        .toList();

    for (int i = 0; i < unPaidLists.length; i++) {
      totalUnpaidAmount += int.parse(unPaidLists[i].paymentTotal);
      debugPrint("Toal Amount ${totalUnpaidAmount}");
    }
    return Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            Container(
              height: 1,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
            ),
            Container(
              height: 45,
              decoration: BoxDecoration(
                color: Color(0xffffcc35),
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Invoice_id',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Start date',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'End date',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Amount',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 10,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            ListView.builder(
              physics: new NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                List<Detail> unPaidInvoiceLists = invoiceListController
                    .invoiceListVo.details!
                    .where((element) => element.paymentStatus == 'Unpaid')
                    .toList();

                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.grey,
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 73,
                              child: InkWell(
                                onTap: () {
                                  setState(() {
                                    currentInvoiceIndex =
                                        unPaidInvoiceLists[index].invoiceId;
                                    paymentStatusIndex = 1;
                                    TabScreens.onlinePaymentIndex = 2;
                                    // changePageIndex = 1;
                                  });
                                },
                                child: Text(
                                  unPaidInvoiceLists[index].invoiceId,
                                  style: TextStyle(
                                      color: Colors.red,
                                      fontSize: 9,
                                      decoration: TextDecoration.underline),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                            Container(
                              width: 63,
                              child: Text(
                                unPaidInvoiceLists[index].startDate,
                                style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 10,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 60,
                              child: Text(
                                unPaidInvoiceLists[index].endDate,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Container(
                              width: 56,
                              child: Text(
                                unPaidInvoiceLists[index].paymentTotal,
                                style:
                                    TextStyle(color: Colors.red, fontSize: 10),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
              itemCount: invoiceListController.invoiceListVo.details!
                  .where((element) => element.paymentStatus == 'Unpaid')
                  .toList()
                  .length,
            ),
            Container(
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                color: Colors.white,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 40),
                    child: Text(
                      'Total',
                      style: TextStyle(color: Colors.black, fontSize: 10),
                    ),
                  ),
                  Padding(
                      padding: const EdgeInsets.only(right: 35),
                     child: Text(
                          totalUnpaidAmount.toString(),
                          style: TextStyle(color: Colors.black, fontSize: 10),
                        )
                      ),
                ],
              ),
            ),
          ],
        ));
  }

  Widget _buildPaymentStatusPaidTitle() {
    return Obx(() {
      if (invoiceListController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              children: [
                Container(
                  height: 1,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
                Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Color(0xffffcc35),
                    border: Border.all(
                      color: Colors.grey,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(
                        'Invoice_id',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                      ),
                      Text(
                        'Start date',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'End date',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                      Text(
                        'Amount',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 10,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
                ListView.builder(
                  physics: new NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (ctx, index) {
                    List<Detail> paidInvoiceLists = invoiceListController
                        .invoiceListVo.details!
                        .where((element) => element.paymentStatus == 'Paid')
                        .toList();

                    return Column(
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                              color: Colors.grey,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 73,
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        TabScreens.onlinePaymentIndex = 2;
                                        print(
                                            "Call page index${TabScreens.onlinePaymentIndex}");
                                        currentInvoiceIndex =
                                            paidInvoiceLists[index].invoiceId;

                                        paymentStatusIndex = 2;
                                        // changePageIndex = 1;
                                      });
                                    },
                                    child: Text(
                                      paidInvoiceLists[index].invoiceId,
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 9,
                                          decoration: TextDecoration.underline),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                                Container(
                                  width: 63,
                                  child: Text(
                                    paidInvoiceLists[index].startDate,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 10,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  width: 60,
                                  child: Text(
                                    paidInvoiceLists[index].endDate,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                                Container(
                                  width: 56,
                                  child: Text(
                                    paidInvoiceLists[index].paymentTotal,
                                    style: TextStyle(
                                        color: Colors.black, fontSize: 10),
                                    textAlign: TextAlign.center,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  itemCount: invoiceListController.invoiceListVo.details!
                      .where((element) => element.paymentStatus == 'Paid')
                      .toList()
                      .length,
                )
              ],
            ));
      }
    });
  }
}
