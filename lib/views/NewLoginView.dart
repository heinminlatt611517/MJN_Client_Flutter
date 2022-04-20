import 'package:MJN/Widgets/login_main_drawer.dart';
import 'package:MJN/controllers/loginController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:MJN/views/SecondLoginView.dart';
import 'package:MJN/views/SignUpView.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'SecondLoginView.dart';

class NewLoginView extends StatefulWidget {

  static const routeName = '/new_login_screen';

  @override
  _NewLoginViewState createState() => _NewLoginViewState();
}

class _NewLoginViewState extends State<NewLoginView> {
  final LoginController loginController = Get.put(LoginController());

  var buildingText = TextEditingController();
  var unitText = TextEditingController();

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedLang = 'ENG';
  final langStorage = GetStorage();


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
            height: 40,
          ),
          Container(
           decoration : BoxDecoration(border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.all(
                  Radius.circular(24.0) //                 <--- border radius here
              ),
            ),
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  width: 130,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 40,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 27),
                          child: Text(
                            'Building',
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 60,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 27),
                          child: Text(
                            'Unit',
                            style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                          ),
                        ),
                        SizedBox(
                          height: 40,
                        ),
                      ]),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(right: 40),
                        height: 45,
                        decoration:
                        BoxDecoration(
                          border: Border.all(color: Colors.white,width: 7),
                        ),
                        child: Container(
                          color: Colors.white12,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: buildingText,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        margin: EdgeInsets.only(right: 40),
                        height: 45,
                        decoration:
                        BoxDecoration(
                          border: Border.all(color: Colors.white,width: 7),
                        ),
                        child: Container(
                          color: Colors.white12,
                          child: Padding(
                            padding: const EdgeInsets.only(bottom: 4),
                            child: TextField(
                              textAlign: TextAlign.center,
                              controller: unitText,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
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

                      if(buildingText.text == '' || unitText.text == ''){
                        AppUtils.showErrorSnackBar('Error!!', 'Data must not empty!!');
                      }
                      else{
                        Future.delayed(Duration.zero, () async {
                          Navigator.of(context).pushReplacementNamed(SecondLoginVIew.routeName);
                        });
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
            height: 50,
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
        body: GestureDetector(
          onTap: (){
            FocusManager.instance.primaryFocus?.unfocus();
          },
            child: loginView()));
  }
}
