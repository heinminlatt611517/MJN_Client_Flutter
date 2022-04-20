import 'package:MJN/CustomDialog/CustomDialogUI.dart';
import 'package:MJN/controllers/loginController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class LoginView1 extends StatefulWidget {
  static const routeName = '/new_login_view1';

  @override
  _LoginView1State createState() => _LoginView1State();
}

class _LoginView1State extends State<LoginView1> {
  final LoginController loginController = Get.put(LoginController());

  var buildingText = TextEditingController();
  var unitText = TextEditingController();

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  String selectedLang = 'ENG';
  final langStorage = GetStorage();
  List<bool> isSelected = [true, false];


  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (langStorage.read(LANGUAGE) == 'MY') {
        setState(() {
          isSelected = [false, true];
        });
      } else if (langStorage.read(LANGUAGE) == 'EN') {
        setState(() {
          isSelected = [true, false];
        });
      }
    });
    super.initState();
  }

  @override
  void didChangeDependencies() {

    WidgetsBinding.instance!.addPostFrameCallback((_) {
      if (langStorage.read(LANGUAGE) == 'MY') {
        setState(() {
          isSelected = [false, true];
        });
      } else if (langStorage.read(LANGUAGE) == 'EN') {
        setState(() {
          isSelected = [true, false];
        });
      }
    });

    super.didChangeDependencies();

  }

  Widget loginView() {
    return SingleChildScrollView(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            height: 10,
          ),
          Image(image: AssetImage('assets/images/login.png')),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              Container(
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
                          'Building:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 27),
                        child: Text(
                          'Unit:',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
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
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      height: 40,
                      padding: EdgeInsets.only(bottom: 6),
                      margin: EdgeInsets.only(right: 27),
                      child: TextField(
                        textAlign: TextAlign.center,
                        controller: buildingText,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 27),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      ),
                      height: 40,
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
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 35,
          ),
          Padding(
              padding: EdgeInsets.only(left: 130, right: 90),
              child: Obx(() {
                if (loginController.isLoading.value) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return NeumorphicButton(
                    onPressed: () {
                      if (buildingText.text == '' || unitText.text == '') {
                        AppUtils.showErrorSnackBar(
                            'Error!!', 'Data must not empty!!');
                      } else {
                        Map<String, String> map = {
                          'building': buildingText.value.text,
                          'unit': unitText.value.text,
                          'app_version': app_version,
                        };
                        loginController.fetchLoginData(map, context);
                      }
                    },
                    child: Center(
                      child: Padding(
                        padding: const EdgeInsets.only(top: 4, bottom: 4),
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
                          BorderRadius.circular(8)),
                      color: Colors.deepOrangeAccent,
                      depth: 0,
//                lightSource: LightSource.topLeft,
                    ),
                  );
                }
              })),
          SizedBox(
            height: 50,
          ),
        ],
      ),
    );
  }

  void showMenuDialog(BuildContext context) {
    showGeneralDialog(
        context: context,
        barrierDismissible: true,
        barrierLabel:
        MaterialLocalizations.of(context).modalBarrierDismissLabel,
        barrierColor: Colors.black45,
        transitionDuration: const Duration(milliseconds: 200),
        pageBuilder: (BuildContext buildContext, Animation animation,
            Animation secondaryAnimation) {
          return SafeArea(
            child:
            Container(margin: EdgeInsets.only(top: 50), child: DialogUI(context)),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          toolbarHeight: 60,
          backgroundColor: Color(0xff242527),
          iconTheme: IconThemeData(color: Colors.grey),
          title: Container(
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //     margin: EdgeInsets.only(right: 50),
                //     child: GestureDetector(
                //         onTap: () {
                //           //showMenuDialog(context);
                //         }, child: Padding(
                //           padding: const EdgeInsets.only(top: 10),
                //           child: Image(image: AssetImage('assets/images/menu_icon.png'),height: 24,width: 23,),
                //         ),)),
                Container(
                    width: 100,
                    child: Image(
                        image: AssetImage(
                            'assets/images/splash_screen_logo.png'))),
              ],
            ),
          ),
          actions: [
            // Container(
            //   margin: EdgeInsets.only(right: 20,top: 24,bottom: 24 ),
            //   padding: EdgeInsets.zero,
            //   decoration: BoxDecoration(
            //     color: Colors.white,
            //     border: Border.all(color: Colors.black, width: 1.0),
            //     borderRadius: BorderRadius.all(Radius.circular(5.0)),
            //   ),
            //   child: ToggleButtons(
            //     constraints: BoxConstraints.tight(Size(35, 35)),
            //     selectedColor: Colors.white,
            //     borderRadius: BorderRadius.circular(5),
            //     fillColor: Colors.blue,
            //     children: [
            //       Container(
            //         alignment: Alignment.center,
            //         child: Text(
            //           'EN',
            //           style: TextStyle(fontSize: 10),
            //         ),
            //       ),
            //       Container(
            //         alignment: Alignment.center,
            //         child: Text(
            //           'MY',
            //           style: TextStyle(fontSize: 10),
            //         ),
            //       ),
            //     ],
            //
            //     onPressed: (int index) {
            //       setState(() {
            //         for (int i = 0; i < isSelected.length; i++) {
            //           isSelected[i] = i == index;
            //         }
            //
            //         if (index == 0) {
            //           langStorage.write(LANGUAGE, 'EN');
            //           var locale = Locale('en', 'US');
            //           Get.updateLocale(locale);
            //         } else {
            //           langStorage.write(LANGUAGE, 'MY');
            //           var locale = Locale('my', 'MM');
            //           Get.updateLocale(locale);
            //         }
            //       });
            //     },
            //     isSelected: isSelected,
            //
            //     //             var locale = Locale('my', 'MM');
            //   ),
            // ),
          ],
        ),
        key: _scaffoldKey,
        backgroundColor: Color(0xff188FC5),
        body: GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: loginView()));
  }
}
