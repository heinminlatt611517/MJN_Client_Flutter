import 'package:MJN/NewViews/LoginView1.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DialogUI extends StatefulWidget {
  BuildContext _context;

  DialogUI(this._context);

  @override
  _DialogUIState createState() => _DialogUIState();
}

class _DialogUIState extends State<DialogUI> {
  String manualOne = 'Login Manual';
  String manualTwo = 'Service Ticket Manual';
  String manualThree = 'Online Payment Manual';
  bool isVisible = false;

  final langStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: 200,
            margin: EdgeInsets.only(top: 30),
            padding: EdgeInsets.only(left: 14, top: 16, bottom: 16),
            alignment: Alignment.center,
            color: Color(0xff242527),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {

                    Future.delayed(Duration.zero,
                            () => {
                            Navigator.pop(context),
                            Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => TabScreens(1)))
                            });

                  },
                  child: Text('About Us',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none)),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {

                    Future.delayed(Duration.zero,
                            () => {
                          Navigator.pop(context),
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => TabScreens(2)))
                        });

                  },
                  child: Text('Products and Services',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none)),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {

                    Future.delayed(Duration.zero,
                            () => {
                          Navigator.pop(context),
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => TabScreens(3)))
                        });


                  },
                  child: Text('Terms & Conditions',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none)),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {

                      if (langStorage.read(TOKEN) == null) {
                        Navigator.pop(context);
                        AppUtils.showLoginDialog('Login',
                            'Please sign in to unlock all\naccount features', context);
                      }
                      else{
                        Navigator.pop(context);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TabScreens(4)));
                      }

                    },
                    child: Text('Contact Us',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none))),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {

                      if (langStorage.read(TOKEN) == null) {
                        Navigator.pop(context);
                        AppUtils.showLoginDialog('Login',
                            'Please sign in to unlock all\naccount features', context);
                      } else
                      {
                        Future.delayed(Duration.zero,
                                () => {
                              Navigator.pop(context),
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => TabScreens(5)))
                            });
                      }

                    },
                    child: Text('My Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none))),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        isVisible = !isVisible;
                      });
                    },
                    child: Text('User Manual',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none,
                            fontSize: 14))),
                isVisible
                    ? SizedBox(
                        height: 15,
                      )
                    : Container(),
                isVisible
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          onPressManual(BASE_URL+langStorage.read(LOGIN_MANUAL));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(manualOne,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none)),
                        ))
                    : Container(),
                isVisible
                    ? SizedBox(
                        height: 15,
                      )
                    : Container(),
                isVisible
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          onPressManual(BASE_URL+langStorage.read(ONLINE_PAYMENT_MANUAL));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(manualTwo,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none)),
                        ))
                    : Container(),
                isVisible
                    ? SizedBox(
                        height: 15,
                      )
                    : Container(),
                isVisible
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                          onPressManual(BASE_URL+langStorage.read(SERVICE_TICKET_MANUAL));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 10),
                          child: Text(manualThree,
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 12,
                                  fontWeight: FontWeight.normal,
                                  decoration: TextDecoration.none)),
                        ))
                    : Container(),
                !isVisible
                    ? SizedBox(
                        height: 20,
                      )
                    : SizedBox(
                        height: 15,
                      ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);

                    langStorage.read(TOKEN) != null
                        ? AppUtils.showLogoutDialog(
                            'Logout',
                            'Are you sure you want to exit\nthis application?',
                            context)
                        : Get.offNamed(LoginView1.routeName);
                  },
                  child: Text(
                      langStorage.read(TOKEN) != null ? 'Logout' : 'Login',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          decoration: TextDecoration.none)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  void onPressManual(String manualLink){
    launch(manualLink);
  }
}
