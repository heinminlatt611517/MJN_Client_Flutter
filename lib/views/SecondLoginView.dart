import 'package:MJN/Widgets/login_main_drawer.dart';
import 'package:MJN/controllers/loginController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/views/SecondLoginView.dart';
import 'package:MJN/views/SignUpView.dart';
import 'package:MJN/views/TabView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class SecondLoginVIew extends StatefulWidget {

  static const routeName = '/secondLogin';

  @override
  _SecondLoginVIewState createState() => _SecondLoginVIewState();
}

class _SecondLoginVIewState extends State<SecondLoginVIew> {
  final LoginController loginController = Get.put(LoginController());

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

  // ignore: non_constant_identifier_names
  Widget SecondLoginWidget() {
    return SingleChildScrollView(
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [

              SizedBox(height: 150,),

              Text('Confirm your unit information',style: TextStyle(fontSize: 16,color: Colors.black),),

              SizedBox(height: 50,),

              Container(
                margin: EdgeInsets.only(left: 30,right: 30),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 7),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text('Building - XXXXX'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 30),
                      child: Text('Unit - XXXXX'),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20,),

              Container(
                alignment: Alignment.centerLeft,
                margin: EdgeInsets.only(left: 30,right: 30),
                width: MediaQuery.of(context).size.width,
                height: 50,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white, width: 7),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(left: 30),
                  child: Text('Tenant Name - XXXXXXX'),
                ),
              ),

              SizedBox(height: 50,),

              Container(
                width: MediaQuery.of(context).size.width,
                height: 40,
                alignment: Alignment.center,
                child: NeumorphicButton(
                  onPressed: () {
                    Navigator.of(context).pushReplacementNamed(TabScreens.routeName);
                  },
                  child: Text(
                    "Confirm",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                        color: Colors.white),
                  ),
                  style: NeumorphicStyle(
                    shape: NeumorphicShape.flat,
                    boxShape: NeumorphicBoxShape.roundRect(
                        BorderRadius.circular(14)),
                    color: Colors.blue,
                    depth: 8,
//                lightSource: LightSource.topLeft,
                  ),
                ),
              ),
            ],
          ),
        ),
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
        body: SecondLoginWidget());
  }
}
