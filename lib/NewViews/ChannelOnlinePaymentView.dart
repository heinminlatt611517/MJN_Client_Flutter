import 'package:MJN/NewViews/MakeOnlinePaymentView.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:flutter/material.dart';

class ChannelOnlinePaymentView extends StatefulWidget {
  @override
  _ChannelOnlinePaymentViewState createState() =>
      _ChannelOnlinePaymentViewState();
}

class _ChannelOnlinePaymentViewState extends State<ChannelOnlinePaymentView> {
  bool isChooseCard = false;
  bool isChooseWallet = false;
  bool isChooseCounter = false;
  bool isChooseBanking = false;

  int changePageIndex = 0;
  late String paymentMethod;

  @override
  void initState() {
    isChooseCard = false;
    isChooseWallet = false;
    isChooseCounter = false;
    isChooseBanking = false;

    changePageIndex = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    if(isChooseWallet){
      paymentMethod = 'wallet';
    }
    else if(isChooseCounter){
      paymentMethod = 'counter';
    }
    else if(isChooseBanking){
      paymentMethod = 'banking';
    }


    return changePageIndex == 1
        ? MakeOnlinePaymentView(paymentMethod)
        : Scaffold(
            backgroundColor: Color(0xff188FC5),
            body: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.only(bottom: 40),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Choose your payment channels',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                          color: Color(0xffe9e9e9)),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.only(top: 5, bottom: 5),
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

                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Image(image: AssetImage('assets/images/cards.png')),
                                    ),


                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Cards',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                          color: Color(0xff188FC5)),
                                    ),
                                  ],
                                ),
                                Padding(
                                    padding: const EdgeInsets.only(right: 20),
                                    child: !isChooseCard
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isChooseCard = true;
                                                isChooseWallet = false;
                                                isChooseCounter = false;
                                                isChooseBanking = false;
                                              });
                                            },
                                            child: Icon(
                                              Icons.radio_button_off,
                                              size: 15,
                                              color: Color(0xff188FC5),
                                            ),
                                          )
                                        : Icon(
                                            Icons.radio_button_checked,
                                            size: 15,
                                            color: Color(0xff188FC5),
                                          )),
                              ],
                            ),
                            isChooseCard
                                ? SizedBox(
                                    height: 15,
                                  )
                                : Container(),
                            isChooseCard
                                ? Image(
                                    image:
                                        AssetImage('assets/images/card_icon.png'))
                                : Container(),
                            isChooseCard
                                ? SizedBox(
                                    height: 15,
                                  )
                                : Container(),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.only(top: 5, bottom: 5),
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

                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Image(image: AssetImage('assets/images/wallet.png')),
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
                                    padding: const EdgeInsets.only(right: 20),
                                    child: !isChooseWallet
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isChooseCard = false;
                                                isChooseWallet = true;
                                                isChooseCounter = false;
                                                isChooseBanking = false;
                                              });
                                            },
                                            child: Icon(
                                              Icons.radio_button_off,
                                              size: 15,
                                              color: Color(0xff188FC5),
                                            ),
                                          )
                                        : Icon(
                                            Icons.radio_button_checked,
                                            size: 15,
                                            color: Color(0xff188FC5),
                                          )),
                              ],
                            ),
                            isChooseWallet
                                ? SizedBox(
                                    height: 15,
                                  )
                                : Container(),
                            isChooseWallet
                                ? Image(
                                    image: AssetImage(
                                        'assets/images/wallet_icon.png'))
                                : Container(),
                            isChooseWallet
                                ? SizedBox(
                                    height: 20,
                                  )
                                : Container(),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.only(top: 5, bottom: 5),
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

                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Image(image: AssetImage('assets/images/counter.png')),
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
                                    padding: const EdgeInsets.only(right: 20),
                                    child: !isChooseCounter
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isChooseCard = false;
                                                isChooseWallet = false;
                                                isChooseCounter = true;
                                                isChooseBanking = false;
                                              });
                                            },
                                            child: Icon(
                                              Icons.radio_button_off,
                                              size: 15,
                                              color: Color(0xff188FC5),
                                            ),
                                          )
                                        : Icon(
                                            Icons.radio_button_checked,
                                            size: 15,
                                            color: Color(0xff188FC5),
                                          )),
                              ],
                            ),
                            isChooseCounter
                                ? SizedBox(
                                    height: 15,
                                  )
                                : Container(),
                            isChooseCounter
                                ? Image(
                                    image: AssetImage(
                                        'assets/images/counter_icon.png'))
                                : Container(),
                            isChooseCounter
                                ? SizedBox(
                                    height: 20,
                                  )
                                : Container(),
                          ],
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        margin: EdgeInsets.only(left: 20, right: 20),
                        padding: EdgeInsets.only(top: 5, bottom: 5),
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

                                    Padding(
                                      padding: const EdgeInsets.all(6.0),
                                      child: Image(image: AssetImage('assets/images/banking.png')),
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
                                    padding: const EdgeInsets.only(right: 20),
                                    child: !isChooseBanking
                                        ? GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                isChooseCard = false;
                                                isChooseWallet = false;
                                                isChooseCounter = false;
                                                isChooseBanking = true;
                                              });
                                            },
                                            child: Icon(
                                              Icons.radio_button_off,
                                              size: 15,
                                              color: Color(0xff188FC5),
                                            ),
                                          )
                                        : Icon(
                                            Icons.radio_button_checked,
                                            size: 15,
                                            color: Color(0xff188FC5),
                                          )),
                              ],
                            ),
                            isChooseBanking
                                ? SizedBox(
                                    height: 15,
                                  )
                                : Container(),
                            isChooseBanking
                                ? Image(
                                    image: AssetImage(
                                        'assets/images/banking_icon.png'))
                                : Container(),
                            isChooseBanking
                                ? SizedBox(
                                    height: 20,
                                  )
                                : Container(),
                          ],
                        )),
                    SizedBox(
                      height: 60,
                    ),
                    Container(
                      child: RaisedButton(
                        onPressed: () {
                          if(isChooseCard){
                            AppUtils.showSuccessSnackBar('Success', 'Go to 2c2p Page');
                          }
                          else if(isChooseCounter || isChooseBanking || isChooseWallet){
                            setState(() {
                              changePageIndex = 1;
                            });
                          }
                          else{

                          }

                        },
                        child: Text('Confirm'),
                        textColor: Color(0xffe9e9e9),
                        color: isChooseCard ||
                                isChooseWallet ||
                                isChooseCounter ||
                                isChooseBanking
                            ? Color(0xffff5f1f)
                            : Color(0xffaaaaaa),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
