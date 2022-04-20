import 'package:MJN/NewViews/NewPaymentView.dart';
import 'package:MJN/controllers/billingResponseController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class OnlinePaymentView extends StatefulWidget {

  @override
  _OnlinePaymentViewState createState() => _OnlinePaymentViewState();
}

class _OnlinePaymentViewState extends State<OnlinePaymentView> {
  var buildTextController = TextEditingController();
  var unitTextController = TextEditingController();
  var contactNumberController = TextEditingController();
  final BillingResponseController billingResponseController =
      Get.put(BillingResponseController());
  final loginDataStorage = GetStorage();

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {

    return TabScreens.onlinePaymentIndex > 0
        ? NewPaymentView()
        : Scaffold(
            backgroundColor: Color(0xff188FC5),
            body: GestureDetector(
              onTap: () {
                FocusManager.instance.primaryFocus?.unfocus();
              },
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Image(
                            image: AssetImage(
                                'assets/images/online_payment_icon.png')),
                      ),
                      SizedBox(
                        height: 100,
                      ),
                      Container(
                        height: 40,
                        decoration: BoxDecoration(
                          color: Color(0xffe9e9e9),
                          border: Border.all(color: Color(0xffe9e9e9)),
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 55),
                                child: Row(
                                  children: [
                                    Text('Building : ',
                                        style: TextStyle(color: Colors.grey)),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 5),
                                        child: TextFormField(
                                          enabled: false,
                                          initialValue: loginDataStorage.read(BUILDING).toString(),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              hintStyle:
                                                  TextStyle(color: Colors.grey)),
                                          style: TextStyle(color: Colors.grey),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              height: 20,
                              width: 1,
                              color: Colors.grey,
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(left: 55),
                                child: Row(
                                  children: [
                                    Text(
                                      'Unit : ',
                                      style: TextStyle(color: Colors.grey),
                                    ),
                                    Expanded(
                                      child: Padding(
                                        padding: const EdgeInsets.only(bottom: 5),
                                        child: TextFormField(
                                          enabled: false,
                                          initialValue: loginDataStorage.read(UNIT).toString(),
                                          decoration: InputDecoration(
                                              border: InputBorder.none,

                                              hintStyle:
                                                  TextStyle(color: Colors.grey)),
                                          style: TextStyle(color: Colors.grey),
                                        ),

                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: [
                          Text(
                            'Contact Number:',
                            style: TextStyle(
                                fontSize: 14, color: Color(0xffe9e9e9)),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.only(left: 50),
                              decoration: BoxDecoration(
                                color: Color(0xffe9e9e9),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                              ),
                              height: 40,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 4),
                                child: TextField(
                                  textAlign: TextAlign.center,
                                  controller: contactNumberController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Obx(() {
                        if (billingResponseController.isLoading.value) {
                          return Center(
                            child: CircularProgressIndicator(),
                          );
                        } else {
                          return Container(
                            width: 110,
                            child: RaisedButton(
                              onPressed: () {
                                if (contactNumberController.value.text == '') {
                                  AppUtils.showErrorSnackBar(
                                      'Fail', 'Please fill contact number:');
                                } else {
                                  billingResponseController
                                      .fetchBillingResponseNumber(
                                        loginDataStorage.read(TOKEN),
                                        loginDataStorage.read(DATA_TENANT_ID),
                                      )
                                      .then((value) => {
                                            if (billingResponseController
                                                    .billingResponseNumberVo!
                                                    .status ==
                                                'Success')
                                              {
                                                if (billingResponseController
                                                        .billingResponseNumberVo!
                                                        .billingResponsiveNo
                                                        .toString() ==
                                                    contactNumberController
                                                        .value.text)
                                                  {
                                                    Future.delayed(
                                                        const Duration(
                                                            milliseconds: 700),
                                                        () {
                                                      setState(() {
                                                        TabScreens.onlinePaymentIndex=1;
                                                      });
                                                    })
                                                  }
                                                else
                                                  {
                                                    AppUtils.showErrorSnackBar(
                                                        'Fail',
                                                        'Invalid Phone Number!!')
                                                  }
                                              }
                                            else if (billingResponseController
                                                    .billingResponseNumberVo!
                                                    .status ==
                                                'Fail')
                                              {
                                                if (billingResponseController
                                                        .billingResponseNumberVo!
                                                        .responseCode ==
                                                    '005')
                                                  {
                                                    AppUtils
                                                        .showSessionExpireDialog(
                                                            'Session is expired',
                                                            'Please login again',
                                                            context)
                                                  }
                                              }
                                          });
                                }
                              },
                              child: Text('Next'),
                              textColor: Color(0xffe9e9e9),
                              color: Color(0xffff5f1f),
                            ),
                          );
                        }
                      })
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}
