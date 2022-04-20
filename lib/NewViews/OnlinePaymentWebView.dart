import 'dart:io';

import 'package:MJN/NewViews/NewPaymentView.dart';
import 'package:MJN/NewViews/PaymentInvoiceView.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class OnlinePaymentWebView extends StatefulWidget {
  String paymentLink;

  OnlinePaymentWebView(this.paymentLink);


  @override
  _OnlinePaymentWebViewState createState() => _OnlinePaymentWebViewState();
}


class _OnlinePaymentWebViewState extends State<OnlinePaymentWebView> {
  int changePageIndex = 0;


  @override
  void initState() {
    super.initState();
    changePageIndex = 0;
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    print(widget.paymentLink);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(child:
      changePageIndex == 1 ? NewPaymentView() : Scaffold(
          body: Container(
            color: Color(0xff188FC5),
            padding: EdgeInsets.all(12),
            child: WebView(
              initialUrl: BASE_URL+widget.paymentLink,
              javascriptMode: JavascriptMode.unrestricted,
            ),
          ),
        ), onWillPop:() async{
     /* setState(() {
        changePageIndex = 1;
      });*/

      return true;
    }, );
  }



}
