import 'package:MJN/controllers/invoiceListController.dart';
import 'package:MJN/controllers/transactionListController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/views/InvoiceDetailView.dart';
import 'package:MJN/views/TransactionDetailView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class PaymentView extends StatefulWidget {
  static const routeName = '/payment_screen';

  @override
  _PaymentViewState createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  var invoice = false;
  var receipt = false;
  int changePageIndex = 0;

   late String currentInvoiceIndex ;
   late String currentTransactionIndex ;
  final loginDataStorage = GetStorage();

  final InvoiceListController invoiceListController =
      Get.put(InvoiceListController());

  final TransactionListController transactionListController =
      Get.put(TransactionListController());

  @override
  void initState() {
    super.initState();
    invoice = false;
    receipt = false;
    changePageIndex = 0;
  }

  @override
  void didChangeDependencies() {
    invoice = false;
    receipt = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    invoiceListController.fetchPaymentInvoiceList(loginDataStorage.read(TOKEN),
        loginDataStorage.read(UID), loginDataStorage.read(DATA_TENANT_ID),context);

    transactionListController.fetchTransactionList(loginDataStorage.read(TOKEN),
        loginDataStorage.read(UID), loginDataStorage.read(DATA_TENANT_ID));

    return changePageIndex == 1
        ? TransactionDetailView(currentTransactionIndex)
        : changePageIndex == 2
            ? InvoiceDetailView(currentInvoiceIndex)
            : Scaffold(
                body: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            "Payment",
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
                        height: 40,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ActionChip(
                                backgroundColor:
                                    invoice ? Colors.amber : Colors.grey,
                                padding: EdgeInsets.only(left: 50, right: 50),
                                label: Text('Invoice',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                onPressed: () {
                                  setState(() {
                                    invoice = true;
                                    receipt = false;
                                  });
                                }),
                          ),
                          Container(
                            height: 32,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: ActionChip(
                                backgroundColor:
                                    receipt ? Colors.amber : Colors.grey,
                                padding: EdgeInsets.only(left: 50, right: 50),
                                label: Text('Receipt',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.black)),
                                onPressed: () {
                                  setState(() {
                                    invoice = false;
                                    receipt = true;
                                  });
                                }),
                          ),
                        ],
                      ),
                      paymentItemLists(),
                    ],
                  ),
                ),
              );
  }

  Widget paymentItemLists() {
    return receipt
        ? Padding(
            padding: const EdgeInsets.all(12.0),
            child:
                Obx((){
                 if (transactionListController.isLoading.value) {
                   return Center(
                     child: CircularProgressIndicator(),
                   );
                 }
                 else {
                   return
                     Column(
                       children: [
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
                           decoration: BoxDecoration(
                             border: Border.all(
                               color: Colors.grey,
                             ),
                           ),
                           child: Row(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                             children: [
                               Text(
                                 'Transaction\nID',
                                 style: TextStyle(color: Colors.black, fontSize: 10),
                                 textAlign: TextAlign.center,
                               ),
                               Container(
                                 width: 1,
                                 height: 45,
                                 color: Colors.grey,
                               ),
                               Text(
                                 'Start date',
                                 style: TextStyle(color: Colors.black, fontSize: 10),
                               ),
                               Container(
                                 width: 1,
                                 height: 45,
                                 color: Colors.grey,
                               ),
                               Text(
                                 'End date',
                                 style: TextStyle(color: Colors.black, fontSize: 10),
                               ),
                               Container(
                                 width: 1,
                                 height: 45,
                                 color: Colors.grey,
                               ),
                               Text(
                                 'Amount',
                                 style: TextStyle(color: Colors.black, fontSize: 10),
                               ),
                             ],
                           ),
                         ),
                         ListView.builder(
                           physics: new NeverScrollableScrollPhysics(),
                           shrinkWrap: true,
                           itemBuilder: (ctx, index) {
                             return Column(
                               children: [
                                 Container(
                                   decoration: BoxDecoration(
                                     color: Colors.white,
                                     border: Border.all(
                                       color: Colors.grey,
                                     ),
                                   ),
                                   child: Row(
                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                     children: [
                                       Container(
                                         width: 73,
                                         child: InkWell(
                                           onTap: () {
                                             setState(() {
                                               currentTransactionIndex =
                                                   transactionListController
                                                       .transactionListVo
                                                       .details[index]
                                                       .transactionId
                                                       .toString();
                                               changePageIndex = 1;
                                             });
                                           },
                                           child: Text(
                                             transactionListController.transactionListVo
                                                 .details[index].transactionId ??
                                                 'null',
                                             style: TextStyle(
                                                 color: Colors.black,
                                                 fontSize: 10,
                                                 decoration: TextDecoration.underline),
                                             textAlign: TextAlign.center,
                                           ),
                                         ),
                                       ),
                                       Container(
                                         width: 1,
                                         height: 45,
                                         color: Colors.grey,
                                       ),
                                       Container(
                                         width: 63,
                                         child: Text(
                                           transactionListController.transactionListVo
                                               .details[index].startDate ??
                                               'null',
                                           style: TextStyle(
                                             color: Colors.black,
                                             fontSize: 10,
                                           ),
                                           textAlign: TextAlign.center,
                                         ),
                                       ),
                                       Container(
                                         width: 1,
                                         height: 45,
                                         color: Colors.grey,
                                       ),
                                       Container(
                                         width: 60,
                                         child: Text(
                                           transactionListController.transactionListVo
                                               .details[index].endDate ??
                                               'null',
                                           style: TextStyle(
                                               color: Colors.black, fontSize: 10),
                                           textAlign: TextAlign.center,
                                         ),
                                       ),
                                       Container(
                                         width: 1,
                                         height: 45,
                                         color: Colors.grey,
                                       ),
                                       Container(
                                         width: 56,
                                         child: Text(
                                           transactionListController.transactionListVo
                                               .details[index].creditAmount ??
                                               'null',
                                           style: TextStyle(
                                               color: Colors.black, fontSize: 10),
                                           textAlign: TextAlign.center,
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),
                               ],
                             );
                           },
                           itemCount: transactionListController
                               .transactionListVo.details.length,
                         )
                       ],
                     );
                 }
                })
          )
        : invoice
            ? Padding(
                padding: const EdgeInsets.all(12.0),
                child:
                    Obx((){
                      if (invoiceListController.isLoading.value) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      else {
                        return
                          Column(
                            children: [
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
                                decoration: BoxDecoration(
                                  border: Border.all(
                                    color: Colors.grey,
                                  ),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(right: 2),
                                      child: Text(
                                        'Invoice ID',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 10),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      height: 30,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      'Start date',
                                      style: TextStyle(color: Colors.black, fontSize: 10),
                                    ),
                                    Container(
                                      width: 1,
                                      height: 30,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(right: 4, left: 4),
                                      child: Text(
                                        'End date',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 10),
                                      ),
                                    ),
                                    Container(
                                      width: 1,
                                      height: 30,
                                      color: Colors.grey,
                                    ),
                                    Text(
                                      'Amount',
                                      style: TextStyle(color: Colors.black, fontSize: 10),
                                    ),
                                    Container(
                                      width: 1,
                                      height: 30,
                                      color: Colors.grey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 1),
                                      child: Text(
                                        'Status',
                                        style:
                                        TextStyle(color: Colors.black, fontSize: 10),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              ListView.builder(
                                physics: new NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                itemBuilder: (ctx, index) {
                                  return Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          border: Border.all(
                                            color: Colors.grey,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                          children: [
                                            Container(
                                              width: 67,
                                              child: InkWell(
                                                onTap: () {
                                                  setState(() {

                                                    if(invoiceListController
                                                        .invoiceListVo
                                                        .details![index]
                                                        .paymentStatus ==
                                                        'Unpaid'){

                                                      currentInvoiceIndex =
                                                          invoiceListController
                                                              .invoiceListVo
                                                              .details![index]
                                                              .invoiceId
                                                              .toString();

                                                      changePageIndex = 2;
                                                    }
                                                    else {
                                                      AppUtils.showSuccessSnackBar('Paid!!', 'Already Paid');
                                                    }
                                                  });

                                                },
                                                child: Text(
                                                  invoiceListController.invoiceListVo
                                                      .details![index].invoiceId ??
                                                      'null',
                                                  style: TextStyle(
                                                      color: invoiceListController
                                                          .invoiceListVo
                                                          .details![index]
                                                          .paymentStatus ==
                                                          'Unpaid'
                                                          ? Color(0xffff0000)
                                                          : Color(0xff000000),
                                                      fontSize: 10,
                                                      decoration:
                                                      TextDecoration.underline),
                                                  textAlign: TextAlign.center,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: 1,
                                              height: 30,
                                              color: Colors.grey,
                                            ),
                                            Container(
                                              width: 66,
                                              child: Text(
                                                invoiceListController.invoiceListVo
                                                    .details![index].startDate ??
                                                    'null',
                                                style: TextStyle(
                                                  color: invoiceListController
                                                      .invoiceListVo
                                                      .details![index]
                                                      .paymentStatus ==
                                                      'Unpaid'
                                                      ? Color(0xffff0000)
                                                      : Color(0xff000000),
                                                  fontSize: 10,
                                                ),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                              width: 1,
                                              height: 30,
                                              color: Colors.grey,
                                            ),
                                            Container(
                                              width: 68,
                                              child: Text(
                                                invoiceListController.invoiceListVo
                                                    .details![index].endDate ??
                                                    'null',
                                                style: TextStyle(
                                                    color: invoiceListController
                                                        .invoiceListVo
                                                        .details![index]
                                                        .paymentStatus ==
                                                        'Unpaid'
                                                        ? Color(0xffff0000)
                                                        : Color(0xff000000),
                                                    fontSize: 10),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                              width: 1,
                                              height: 30,
                                              color: Colors.grey,
                                            ),
                                            Container(
                                              width: 57,
                                              child: Text(
                                                invoiceListController.invoiceListVo
                                                    .details![index].creditAmount ??
                                                    'null',
                                                style: TextStyle(
                                                    color: invoiceListController
                                                        .invoiceListVo
                                                        .details![index]
                                                        .paymentStatus ==
                                                        'Unpaid'
                                                        ? Color(0xffff0000)
                                                        : Color(0xff000000),
                                                    fontSize: 10),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                            Container(
                                              width: 1,
                                              height: 30,
                                              color: Colors.grey,
                                            ),
                                            Container(
                                              width: 52,
                                              child: Text(
                                                invoiceListController.invoiceListVo
                                                    .details![index].paymentStatus ??
                                                    'null',
                                                style: TextStyle(
                                                    color: invoiceListController
                                                        .invoiceListVo
                                                        .details![index]
                                                        .paymentStatus ==
                                                        'Unpaid'
                                                        ? Color(0xffff0000)
                                                        : Color(0xff000000),
                                                    fontSize: 10),
                                                textAlign: TextAlign.center,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  );
                                },
                                itemCount:
                                invoiceListController.invoiceListVo.details!.length,
                              )
                            ],
                          );
                      }
                    })
              )
            : Container();
  }
}
