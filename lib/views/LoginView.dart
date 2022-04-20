import 'package:MJN/Widgets/login_main_drawer.dart';
import 'package:MJN/controllers/loginController.dart';
import 'package:MJN/models/notificationModelVO.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/views/SecondLoginView.dart';
import 'package:MJN/views/SignUpView.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginView extends StatefulWidget {
  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginController loginController = Get.put(LoginController());

  var emailText = TextEditingController();
  var passwordText = TextEditingController();

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedLang = 'ENG';
  final langStorage = GetStorage();

  int _selectedPageIndex = 0;

  @override
  void initState() {

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (langStorage.read(LANGUAGE) == 'မြန်မာ') {
        var locale = Locale('my', 'MM');
        Get.updateLocale(locale);

        setState(() {
          selectedLang = 'မြန်မာ';
        });
      } else if (langStorage.read(LANGUAGE) == 'ENG') {
        var locale = Locale('en', 'US');
        Get.updateLocale(locale);

        setState(() {
          selectedLang = 'ENG';
        });
      }
    });



    super.initState();
  }



  @override
  void didChangeDependencies() {

    super.didChangeDependencies();
  }



  Widget getSelectedPage() {
    int pageIndex = 0;
    pageIndex = _selectedPageIndex;
    switch (pageIndex) {
      case 0:
        return loginView();
      case 1:
        return SecondLoginVIew();
    }

    return loginView();
  }




  Widget loginView() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 40,
          ),
          FlutterLogo(
            size: 100,
          ),
          SizedBox(
            height: 80,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: TextField(
                  controller: emailText,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Email",
                  )),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Container(
            margin: EdgeInsets.only(left: 20, right: 20),
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.blueAccent),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 5),
              child: TextField(
                controller: passwordText,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Enter Password",
                ),
                obscureText: true,
              ),
            ),
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
              padding: EdgeInsets.only(left: 130, right: 130),
              child: Obx(() {
                if (loginController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return NeumorphicButton(
                    onPressed: () {

                      if(emailText.text == '' && passwordText.text == ''){
                        AppUtils.showErrorSnackBar('Error!!', 'Email and Password must not empty!!');
                      }

                     else if(emailText.text == ''){
                        AppUtils.showErrorSnackBar('Error!!', 'Email must not empty!!');
                      }
                      else if(passwordText.text == ''){
                        AppUtils.showErrorSnackBar('Error!!', 'Password must not empty!!');
                      }

                      else {
                        Map<String,String> map = {
                          'user_name': emailText.value.text,
                          'app_version': app_version,
                          'password': passwordText.value.text,
                        };
                        loginController.fetchLoginData(map,context);
                      }

                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8, bottom: 8),
                        child: Text(
                          "login".tr,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                              color: Colors.white),
                        ),
                      ),
                    ),
                    style: NeumorphicStyle(
                      shape: NeumorphicShape.flat,
                      boxShape: NeumorphicBoxShape.roundRect(
                          BorderRadius.circular(18)),
                      color: Colors.blue,
                      depth: 8,
//                lightSource: LightSource.topLeft,
                    ),
                  );
                }
              })),
          SizedBox(
            height: 40,
          ),
          InkWell(
              onTap: () {}, child: Center(child: Text('forgetPassword'.tr))),
          SizedBox(
            height: 30,
          ),
          InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  return SignUpView();
                }));
              },
              child: Container(
                  alignment: Alignment.center,
                  width: MediaQuery.of(context).size.width,
                  child: Text('signUp'.tr))),
        ],
      ),
    );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 110,
          backgroundColor: Colors.white70,
          iconTheme: IconThemeData(color: Colors.grey),
          actions: [
            Container(
              height: 50,
              width: 75,
              margin: EdgeInsets.only(bottom: 37, right: 30, top: 33),
              padding: EdgeInsets.all(3),
              child: Neumorphic(
                style: NeumorphicStyle(
                    color: Colors.white, lightSource: LightSource.topLeft),
                child: DropdownButtonFormField<String>(
                  isExpanded: true,
                  value: selectedLang,
                  items: ["မြန်မာ", "ENG"]
                      .map((label) => DropdownMenuItem(
                            child: Text(
                              label,
                              style: TextStyle(fontSize: 12),
                            ),
                            value: label,
                          ))
                      .toList(),
                  onChanged: (value) {
                    setState(() {
                      if (value == 'မြန်မာ') {
                        langStorage.write(LANGUAGE, value);
                        var locale = Locale('my', 'MM');
                        Get.updateLocale(locale);
                      } else if (value == 'ENG') {
                        langStorage.write(LANGUAGE, value);
                        var locale = Locale('en', 'US');
                        Get.updateLocale(locale);
                      }
                    });
                  },
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8.0)),
                      contentPadding: EdgeInsets.only(left: 10, bottom: 12)),
                ),
              ),
            ),
          ],
        ),
        drawer: Container(child: LoginMainDrawer()),
        key: _scaffoldKey,
        backgroundColor: Colors.grey.shade100,
        body: loginView());
  }
}


