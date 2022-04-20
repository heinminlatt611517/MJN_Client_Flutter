import 'package:flutter/material.dart';

class MakeOnlinePaymentView extends StatefulWidget {
  String paymentMethod;

  MakeOnlinePaymentView(this.paymentMethod);

  @override
  _MakeOnlinePaymentViewState createState() => _MakeOnlinePaymentViewState();
}

class _MakeOnlinePaymentViewState extends State<MakeOnlinePaymentView> {
  var walletPaymentCodeController = TextEditingController();
  var counterPaymentCodeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff188FC5),
      body: widget.paymentMethod == 'wallet'
          ? _buildMobileWalletUI()
          : widget.paymentMethod == 'counter'
              ? _buildCounterPaymentUI()
              : widget.paymentMethod == 'banking'
                  ? _buildMobileBankiingUI()
                  : Container(),
    );
  }

  Widget _buildMobileWalletUI() {

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  padding: EdgeInsets.only(bottom: 20,top: 10),
                  decoration: BoxDecoration(
                    color: Color(0xfffafafa),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              Icon(
                                Icons.credit_card,
                                color: Color(0xff188FC5),
                                size: 40,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Mobile Wallet',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Color(0xff188FC5)),
                              ),
                            ],
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Icon(
                              Icons.radio_button_checked,
                              size: 15,
                              color: Color(0xff188FC5),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Image(image: AssetImage('assets/images/wallet_icon.png')),
                    ],
                  )),


              SizedBox(
                height: 60,
              ),
              Container(
                alignment: Alignment.center,
                child: Text(
                  'Payment Code :',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                      color: Color(0xffe9e9e9)),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                margin: EdgeInsets.only(left: 20,right: 20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                height: 40,
                child: TextField(
                  textAlign: TextAlign.center,
                  controller: walletPaymentCodeController,
                  decoration: InputDecoration(
                    hintText: 'xxxxxxxxxxxx',
                    border: InputBorder.none,
                  ),
                ),
              ),
              SizedBox(
                height: 70,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(
                    'Payment Guide :',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Color(0xffe9e9e9)),
                  ),
                  Text(
                    '1. Go to Kpay or OK dollar or Wave Mobile Wallet.',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xffe9e9e9)),
                  ),
                  Text(
                    '2. Choose Bill Payment or Quick Pay in the app.',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xffe9e9e9)),
                  ),
                  Text(
                    '3. Select 123 Service',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xffe9e9e9)),
                  ),
                  Text(
                    '4. Enter your payment code.',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xffe9e9e9)),
                  ),
                ],),
              ),
            ],
        ),
      ),
    );
  }

  Widget _buildCounterPaymentUI() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(bottom: 20,top: 10),
                decoration: BoxDecoration(
                  color: Color(0xfffafafa),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.credit_card,
                              color: Color(0xff188FC5),
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Counter Payment',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xff188FC5)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.radio_button_checked,
                            size: 15,
                            color: Color(0xff188FC5),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Image(image: AssetImage('assets/images/counter_icon2.png')),
                  ],
                )),


            SizedBox(
              height: 60,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                'Payment Code :',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xffe9e9e9)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              margin: EdgeInsets.only(left: 20,right: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(5.0)),
              ),
              height: 40,
              child: TextField(
                textAlign: TextAlign.center,
                controller: walletPaymentCodeController,
                decoration: InputDecoration(
                  hintText: 'xxxxxxxxxxxx',
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 70,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Guide :',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Color(0xffe9e9e9)),
                  ),
                  Text(
                    '1. Find the nearest shop.',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xffe9e9e9)),
                  ),
                  Text(
                    '2. Show your payment code',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xffe9e9e9)),
                  ),
                  Text(
                    '3. Make payment under 123 service.',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xffe9e9e9)),
                  ),

                ],),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildMobileBankiingUI() {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
               padding: EdgeInsets.only(top: 5,bottom: 5),
                decoration: BoxDecoration(
                  color: Color(0xfffafafa),
                  borderRadius: BorderRadius.all(Radius.circular(5.0)),
                ),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            SizedBox(
                              width: 20,
                            ),
                            Icon(
                              Icons.credit_card,
                              color: Color(0xff188FC5),
                              size: 40,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              'Mobile Banking/Internet Banking',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  color: Color(0xff188FC5)),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.radio_button_checked,
                            size: 15,
                            color: Color(0xff188FC5),
                          ),
                        ),
                      ],
                    ),


                  ],
                )),

            SizedBox(
              height:40,
            ),

            Container(
              margin: EdgeInsets.only(left: 20),
              child: Row(children: [

                Image(image: AssetImage('assets/images/vertical_banking_icon.png')),

                SizedBox(
                  width:40,
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                  Text(
                    'Account Number',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Color(0xffe9e9e9)),
                  ),
                  Text(
                    'XXXXXXXXXXXXXXXXXX',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 18,
                        color: Color(0xffe9e9e9)),
                  ),

                  SizedBox(
                    height:60,
                  ),


                  Text(
                    'Account Number',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                        color: Color(0xffe9e9e9)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5),
                    child: Text(
                      'XXXXXXXXXXXXXXXXXX',
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 18,
                          color: Color(0xffe9e9e9)),
                    ),
                  ),


                ],)

              ],),
            ),


            SizedBox(
              height: 80,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Payment Guide :',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 14,
                        color: Color(0xffe9e9e9)),
                  ),
                  Text(
                    '1. Login to preferred channel.',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xffe9e9e9)),
                  ),

                  Text(
                    '2. Mention your invoice number or\nthe building information. ',
                    style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 12,
                        color: Color(0xffe9e9e9)),
                  ),
                ],),
            ),
          ],
        ),
      ),
    );
  }
}
