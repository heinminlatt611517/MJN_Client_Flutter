import 'package:MJN/controllers/invoiceController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/PaymentView.dart';
import 'package:MJN/views/SelectPaymentView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class InvoiceDetailView extends StatefulWidget {
  final String invoiceID;

  InvoiceDetailView(this.invoiceID);

  @override
  _InvoiceDetailViewState createState() => _InvoiceDetailViewState();
}

class _InvoiceDetailViewState extends State<InvoiceDetailView> {
  int changePageIndex = 0;
  final InvoiceController invoiceController = Get.put(InvoiceController());
  final langStorage = GetStorage();

  @override
  void initState() {
    changePageIndex = 0;
    invoiceController.fetchInvoiceDataByID(
        langStorage.read(TOKEN), langStorage.read(UID), widget.invoiceID,'');
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return changePageIndex == 1
        ? PaymentView()
        : changePageIndex == 2
            ? SelectPaymentView(widget.invoiceID)
            : SingleChildScrollView(
                child: Obx(() {
                  if (invoiceController.isLoading.value) {
                    return Center(child: CircularProgressIndicator());
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
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 30),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 40),
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
                                        padding:
                                            const EdgeInsets.only(left: 20),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(':' +
                                                langStorage.read(USER_NAME)),
                                            Text(':' +
                                                invoiceController.invoiceVo
                                                    .details.invoiceId),
                                            Text(': 10 Mbps'),
                                            Text(': 24 Aug 21'),
                                            Text(': 23 jun 10'),
                                            Text(': 20 jan 12'),
                                            Text(': 50000 MMK'),
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
                                    margin:
                                        EdgeInsets.only(left: 50, right: 60),
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
                                        padding:
                                            const EdgeInsets.only(right: 65),
                                        child: Text('Total Due'),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(right: 25),
                                        child: Text('')
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 40,
                                    alignment: Alignment.center,
                                    child: NeumorphicButton(
                                      onPressed: () {
                                        setState(() {
                                          changePageIndex = 2;
                                        });
                                      },
                                      child: Text(
                                        "Make Payment",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 14,
                                            color: Colors.white),
                                      ),
                                      style: NeumorphicStyle(
                                        shape: NeumorphicShape.flat,
                                        boxShape: NeumorphicBoxShape.roundRect(
                                            BorderRadius.circular(14)),
                                        color: Colors.amber,
                                        depth: 8,
//                lightSource: LightSource.topLeft,
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
                }),
              );
  }
}
