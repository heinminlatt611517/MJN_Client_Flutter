import 'package:MJN/NewViews/LoginView1.dart';
import 'package:MJN/main.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:store_redirect/store_redirect.dart';
import 'package:url_launcher/url_launcher.dart';

import 'app_constants.dart';

class AppUtils {
  static void showErrorSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      icon: Icon(Icons.error, color: Colors.black),
      backgroundColor: Colors.red,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  static void showSuccessSnackBar(String title, String message) {
    Get.snackbar(
      title,
      message,
      icon: Icon(Icons.done, color: Colors.black),
      backgroundColor: Colors.green,
      snackPosition: SnackPosition.BOTTOM,
      duration: Duration(seconds: 2),
    );
  }

  static Future<void> removeDataFromGetStorage() async {
    final box = GetStorage();
    box.remove(TOKEN);
    box.remove(PHONE_NO);
    box.remove(UID);
    box.remove(UNIT);
    box.remove(BUILDING);
    box.remove(DATA_TENANT_ID);
  }

  static void showLogoutDialog(
      String title, String message, BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (_) => Center(
                child: Container(
                  height: 270,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(4),
                  // decoration: BoxDecoration(
                  //   image: DecorationImage(
                  //     image: AssetImage("assets/images/dialog_card_bg.png"),
                  //     fit: BoxFit.fill,
                  //   ),
                  // ),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                          image: AssetImage('assets/images/logout_icon.png')),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            title,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Color(0xff188FC5),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 40),
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                fontSize: 14,
                                color: Color(0xff188FC5)),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 100,
                                height: 40,
                                child: RaisedButton(
                                    color: Color(0xff188FC5),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    }),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 100,
                                height: 40,
                                child: RaisedButton(
                                    color: Color(0xff188FC5),
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    onPressed: () {
                                      AppUtils.removeDataFromGetStorage().then(
                                          (value) => {
                                                Get.offAllNamed(Splash2.routeName)
                                              });

                                      //Navigator.of(context).pushReplacementNamed(Splash2.routeName);
                                    }),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
    });
  }

  static void showLoginDialog(
      String title, String message, BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (_) => Center(
                child: Container(
                  height: 270,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.all(4),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image(
                          image: AssetImage('assets/images/account_icon.png')),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 20),
                          child: Text(
                            title,
                            style: TextStyle(
                                decoration: TextDecoration.none,
                                color: Color(0xff188FC5),
                                fontWeight: FontWeight.bold,
                                fontSize: 20.0),
                          ),
                        ),
                      ),
                      Center(
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 50),
                          child: Text(
                            message,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              fontSize: 14,
                              color: Color(0xff188FC5),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 100,
                                height: 40,
                                child: RaisedButton(
                                    color: Color(0xff188FC5),
                                    child: Text(
                                      'Cancel',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    onPressed: () {
                                      Get.back();
                                    }),
                              ),
                            ),
                            SizedBox(
                              width: 40,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.circular(8),
                              child: Container(
                                width: 100,
                                height: 40,
                                child: RaisedButton(
                                    color: Color(0xff188FC5),
                                    child: Text(
                                      'OK',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                    onPressed: () {
                                      Get.offNamed(LoginView1.routeName);
                                      //Navigator.of(context,rootNavigator: true).pop();
                                    }),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ));
    });
  }

  static void showSessionExpireDialog(
      String title, String message, BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => Center(
                child: Container(
                  height: 270,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  //child: Material(
                  //child: Container(
                  padding: EdgeInsets.all(4),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.error_outline,
                        size: 60,
                        color: Color(0xff188FC5),
                      ),
                      Center(
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Color(0xff188FC5),
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Center(
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Color(0xff188FC5),),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.5555,
                          height: MediaQuery.of(context).size.height * 0.0625,
                          child: RaisedButton(
                              color: Color(0xff188FC5),
                              child: Text(
                                'OK',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              ),
                              onPressed: () {
                                Get.back();
                                AppUtils.removeDataFromGetStorage().then(
                                    (value) => {
                                          Get.offAllNamed(LoginView1.routeName)
                                        });
                              }),
                        ),
                      ),
                    ],
                  ),
                ),
              ));
    });
  }

  static void showRequireUpdateDialog(
      String title, String message, BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
          barrierDismissible: false,
          context: context,
          builder: (_) => Center(
                child: Container(
                  height: 270,
                  width: double.infinity,
                  margin: EdgeInsets.all(10),
                  //child: Material(
                  //child: Container(
                  padding: EdgeInsets.all(4),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(
                        Icons.update,
                        size: 60,
                        color: Color(0xff188FC5),
                      ),
                      Center(
                        child: Text(
                          title,
                          style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Color(0xff188FC5),
                              fontWeight: FontWeight.bold, fontSize: 20.0),
                        ),
                      ),
                      Center(
                        child: Text(
                          message,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 14,
                              color: Color(0xff188FC5),decoration: TextDecoration.none),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              width: 100,
                              height: 40,
                              child: RaisedButton(
                                   color: Color(0xff188FC5),
                                  child: Text(
                                    'Ignore',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  onPressed: () {
                                    Get.offAll(TabScreens(0));
                                  }),
                            ),
                          ),
                          SizedBox(
                            width: 40,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Container(
                              height: 40,
                              child: RaisedButton(
                                  color: Color(0xff188FC5),
                                  child: Text(
                                    'Update Now',
                                    style: TextStyle(
                                      color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16),
                                  ),
                                  onPressed: () {
                                    StoreRedirect.redirect(androidAppId: 'com.moc.mjninternetapp',iOSAppId: '1603638669');
                                  }),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ));
    });
  }

  static void showOnlineRegistrationDialog(BuildContext context) {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      showDialog(
          context: context,
          builder: (_) => Center(
                child: Container(
                  height: 200,
                  width: double.infinity,
                  margin: EdgeInsets.all(50),
                  padding: EdgeInsets.all(10),
                  color: Colors.white,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Center(
                        child: Text(
                          'Choose your location',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Color(0xff188FC5),
                          ),
                        ),
                      ),
                      RaisedButton(
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Text(
                            'Star City',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        color: Color(0xff188FC5),
                        onPressed: () {
                          launch(
                              'http://mojoenet.myanmaronlinecreations.com/webapp/online_registration/star_city');
                        },
                      ),
                      RaisedButton(
                        color: Color(0xff188FC5),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 40, right: 40),
                          child: Text(
                            'City Loft',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        onPressed: () {
                          launch(
                              'http://mojoenet.myanmaronlinecreations.com/webapp/online_registration/city_loft');
                        },
                      ),
                    ],
                  ),
                ),
              ));
    });
  }
}
