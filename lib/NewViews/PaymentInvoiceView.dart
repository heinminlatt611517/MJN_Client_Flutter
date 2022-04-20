import 'package:MJN/NewViews/NewPaymentView.dart';
import 'package:MJN/NewViews/OnlinePaymentWebView.dart';
import 'package:MJN/controllers/getPaymentMethodController.dart';
import 'package:MJN/controllers/invoiceController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';


class PaymentInvoiceView extends StatefulWidget {
  String paymentStatus;
  String invoiceID;

  PaymentInvoiceView(this.paymentStatus, this.invoiceID);

  @override
  _PaymentInvoiceViewState createState() => _PaymentInvoiceViewState();
}

class _PaymentInvoiceViewState extends State<PaymentInvoiceView> {
  int changePageIndex = 0;

  final InvoiceController invoiceController = Get.put(InvoiceController());
  final GetPaymentMethodController getPaymentMethodController =
      Get.put(GetPaymentMethodController());
  final langStorage = GetStorage();

  late String paymentMethodLink;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    changePageIndex = 0;
    super.initState();

    print(widget.paymentStatus);
    print(widget.invoiceID);
  }

  @override
  void setState(fn) {
    if (mounted) {
      super.setState(fn);
    }
  }

  @override
  Widget build(BuildContext context) {
    invoiceController.fetchInvoiceDataByID(
        langStorage.read(TOKEN),
        langStorage.read(UID),
        widget.invoiceID,
        langStorage.read(DATA_TENANT_ID));

    return TabScreens.onlinePaymentIndex > 2
        ? OnlinePaymentWebView(paymentMethodLink)
        : TabScreens.onlinePaymentIndex == 1
            ? NewPaymentView()
            : Scaffold(
                backgroundColor: Color(0xff188FC5),
                body: SingleChildScrollView(
                  child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(20.0),
                      child: _buildWidget()),
                ),
              );
  }

  Widget _buildWidget() {
    return Obx(() {
      if (invoiceController.isLoading.value) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else {
        return Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Invoice',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                      color: Color(0xffe9e9e9)),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        _buildLabelText(),
                        _buildMiddleText(),
                        _buildNetworkDataText(),
                      ]),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  height: 1,
                  width: MediaQuery.of(context).size.width,
                  color: Colors.black54,
                ),
                SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 8,right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Due',
                        style: TextStyle(fontSize: 12, color: Colors.black),
                      ),

                      Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.only(left: 20),
                        child: Text(
                          '.....................',
                          style: TextStyle(
                            color: Color(0xffe9e9e9),
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),

                      Container(
                        width: 100,
                        child: Text(
                          invoiceController.invoiceVo.details.totalDue,
                          textAlign: TextAlign.left,
                          style: TextStyle(fontSize: 12, color: Color(0xffe9e9e9)),
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 20,
                ),
                Container(
                  child: RaisedButton(
                    onPressed: () {
                      if (widget.paymentStatus == 'Unpaid') {
                        getPaymentMethodController
                            .fetchPaymentMethod(
                              langStorage.read(TOKEN),
                              langStorage.read(DATA_TENANT_ID),
                              widget.invoiceID,
                            )
                            .then((value) => {
                                  if (getPaymentMethodController
                                          .getPaymentMethodsVo!.status ==
                                      'Success')
                                    {
                                      Future.delayed(
                                          const Duration(milliseconds: 700),
                                          () {
                                        setState(() {
                                          changePageIndex = 1;
                                          TabScreens.onlinePaymentIndex = 3;
                                          paymentMethodLink =
                                              getPaymentMethodController
                                                  .getPaymentMethodsVo!
                                                  .details
                                                  .paymentLink;
                                        });
                                      })
                                    }
                                });
                      }
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text((widget.paymentStatus == 'Unpaid')
                          ? 'Make Payment'
                          : 'Paid'),
                    ),
                    textColor: Color(0xffe9e9e9),
                    color: Color(0xffff5f1f),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      TabScreens.onlinePaymentIndex = 1;
                      //widget.invoiceID = '';
                      // widget.paymentStatus = '';
                    });
                  },
                  child: Text(
                    'Statement',
                    style: TextStyle(
                        color: Colors.black,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ));
      }
    });
  }

  Widget _buildMiddleText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText('.....................',Color(0xffe9e9e9)),
        _buildText('.....................',Color(0xffe9e9e9)),
        _buildText('.....................',Color(0xffe9e9e9)),
        _buildText('.....................',Color(0xffe9e9e9)),
        _buildText('.....................',Color(0xffe9e9e9)),
        _buildText('.....................',Color(0xffe9e9e9)),
        _buildText('.....................',Color(0xffe9e9e9)),


        Visibility(
          visible: widget.paymentStatus == 'Paid' ? true : false,
          child: _buildText('.....................',Color(0xffe9e9e9)),
        ),

        _buildText('.....................',Color(0xffe9e9e9)),
        _buildText('.....................',Color(0xffe9e9e9)),

        Visibility(
          visible: invoiceController.invoiceVo.details.discount_total == '0' ? false : true,
          child: _buildText('.....................',Color(0xffe9e9e9)),
        ),
        Visibility(
          visible: invoiceController.invoiceVo.details.activationFee == '0' ? false : true,
          child: _buildText('.....................',Color(0xffe9e9e9)),
        ),
        Visibility(
          visible: invoiceController.invoiceVo.details.reactivationFee == '0' ? false : true,
          child: _buildText('.....................',Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.equipmentTotal == '0' ? false : true,
          child: _buildText('.....................',Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.otherTotal == '0' ? false : true,
          child: _buildText('.....................',Color(0xffe9e9e9)),
        ),
        Visibility(
          visible: invoiceController.invoiceVo.details.fiber_rental == '0' ? false : true,
          child: _buildText('.....................',Color(0xffe9e9e9)),
        ),
        Visibility(
          visible: invoiceController.invoiceVo.details.ipvpn == '0' ? false : true,
          child: _buildText('.....................',Color(0xffe9e9e9)),
        ),

        _buildText('.....................',Color(0xffe9e9e9)),
        _buildText('.....................',Color(0xffe9e9e9)),
      ],
    );
  }

  Widget _buildNetworkDataText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText(invoiceController.invoiceVo.details.name,Color(0xffe9e9e9)),
        _buildText(invoiceController.invoiceVo.details.firstname,Color(0xffe9e9e9)),
        _buildText(invoiceController.invoiceVo.details.lastname,Color(0xffe9e9e9)),
        _buildText(invoiceController.invoiceVo.details.building,Color(0xffe9e9e9)),
        _buildText(invoiceController.invoiceVo.details.unit,Color(0xffe9e9e9)),
        _buildText(invoiceController.invoiceVo.details.startDate,Color(0xffe9e9e9)),
        _buildText(invoiceController.invoiceVo.details.endDate,Color(0xffe9e9e9)),

        Visibility(
          visible: widget.paymentStatus == 'Paid' ? true : false,
          child: _buildText(invoiceController.invoiceVo.details.transactionDate,Color(0xffe9e9e9)),
        ),
        _buildText(invoiceController.invoiceVo.details.invoiceId,Color(0xffe9e9e9)),
        _buildText(invoiceController.invoiceVo.details.creationDate,Color(0xffe9e9e9)),

        Visibility(
          visible:invoiceController.invoiceVo.details.discount_total == '0' ? false : true,
          child: _buildText(invoiceController.invoiceVo.details.discount_total,Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.activationFee == '0' ? false : true,
          child: _buildText(invoiceController.invoiceVo.details.activationFee,Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.reactivationFee == '0' ? false : true,
          child: _buildText(invoiceController.invoiceVo.details.reactivationFee,Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.equipmentTotal == '0' ? false : true,
          child: _buildText(invoiceController.invoiceVo.details.equipmentTotal,Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.otherTotal == '0' ? false : true,
          child: _buildText(invoiceController.invoiceVo.details.otherTotal,Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.fiber_rental == '0' ? false : true,
          child: _buildText(invoiceController.invoiceVo.details.fiber_rental,Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.ipvpn == '0' ? false : true,
          child: _buildText(invoiceController.invoiceVo.details.ipvpn,Color(0xffe9e9e9)),
        ),
        _buildText(invoiceController.invoiceVo.details.amount,Color(0xffe9e9e9)),
        _buildText(invoiceController.invoiceVo.details.tax,Color(0xffe9e9e9)),
      ],
    );
  }

  Widget _buildLabelText() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildText('Account',Color(0xffe9e9e9)),
        _buildText('First Name',Color(0xffe9e9e9)),
        _buildText('Last Name',Color(0xffe9e9e9)),
        _buildText('Building',Color(0xffe9e9e9)),
        _buildText('Unit',Color(0xffe9e9e9)),
        _buildText('Start date',Color(0xffe9e9e9)),
        _buildText('End date',Color(0xffe9e9e9)),
        Visibility(
          visible: widget.paymentStatus == 'Paid' ? true : false,
          child: _buildText('Transaction date',Color(0xffe9e9e9)),
        ),
        _buildText('Invoice ID',Color(0xffe9e9e9)),
        _buildText('Invoice date',Color(0xffe9e9e9)),

        Visibility(
          visible:invoiceController.invoiceVo.details.discount_total == '0' ? false : true,
          child: _buildText('Discount',Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.activationFee == '0' ? false : true,
          child: _buildText('OTC charges amount',Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.reactivationFee == '0' ? false : true,
          child: _buildText('Re-activation fee',Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.equipmentTotal == '0' ? false : true,
          child: _buildText('Equipment cost',Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.otherTotal == '0' ? false : true,
          child: _buildText('Other costs',Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.fiber_rental == '0' ? false : true,
          child: _buildText('Fiber Rental',Color(0xffe9e9e9)),
        ),
        Visibility(
          visible:invoiceController.invoiceVo.details.ipvpn == '0' ? false : true,
          child: _buildText('IP Address',Color(0xffe9e9e9)),
        ),


        _buildText('Amount',Colors.black),
        _buildText('Tax',Colors.black),

      ],
    );
  }

 Widget _buildText(String text,Color color){
    return Padding(
      padding: const EdgeInsets.only(top: 8),
      child: Text(
         text,
         style: TextStyle(fontSize: 12, color: color),
       ),
    );
  }
}
