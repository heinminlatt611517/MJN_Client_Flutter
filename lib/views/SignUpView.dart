import 'package:MJN/controllers/singUpController.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';

class SignUpView extends StatelessWidget {
  static const routeName = '/sign_up';
  TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 16.0);
  var buildingText = TextEditingController();
  var unitText = TextEditingController();
  var contactNumberText = TextEditingController();

  var _scaffoldKey = GlobalKey<ScaffoldState>();

  final SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white70,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('Sign Up',style: TextStyle(color: Colors.black),),
      ),
      key: _scaffoldKey,
      backgroundColor: Colors.grey.shade100,
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: SingleChildScrollView(
              child: Container(
                child: Column(
                  children: [

                    SizedBox(
                      height: 50,
                    ),

                    Text(
                      'Please fill up required information',
                      style: TextStyle(fontSize: 18),
                    ),

                    Row(
                      children: [
                        Container(
                          width: 150,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 45,
                                ),
                                Text(
                                  'Building',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 45,
                                ),
                                Text(
                                  'Unit',
                                  style: TextStyle(fontSize: 16),
                                ),
                                SizedBox(
                                  height: 40,
                                ),
                                Text(
                                  'Contact Number',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ]),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 50,
                              ),
                              Container(
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
                                height: 10,
                              ),
                              Container(
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
                              SizedBox(
                                height: 10,
                              ),
                              Container(
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
                                      controller: contactNumberText,
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


                    SizedBox(
                      height: 50,
                    ),

                    Container(
                      width: 200,
                      child: Obx(() {
                        if(signUpController.isLoading.value){
                          return Center(child: CircularProgressIndicator());
                        }
                        else {
                          return
                            NeumorphicButton(
                              onPressed: () {

                                if(buildingText.text == '' || unitText.text == '' || contactNumberText.text == ''){
                                  AppUtils.showErrorSnackBar('Error!!', 'Data must not empty!!');
                                }
                                else{
                                  Map<String,String> map = {
                                    'building': buildingText.value.text,
                                    'unit': unitText.value.text,
                                    'phone': contactNumberText.value.text,
                                  };

                                  signUpController.signUp(map);
                                }


                              },
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                                  child: Text(
                                    "Sign Up",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 16,
                                        color: Colors.white),
                                  ),
                                ),
                              ),
                              style: NeumorphicStyle(
                                shape: NeumorphicShape.flat,
                                boxShape:
                                NeumorphicBoxShape.roundRect(BorderRadius.circular(18)),
                                color: Colors.blue,
                                depth: 8,
//                lightSource: LightSource.topLeft,
                              ),
                            );
                        }
                      })
                    ),

                  ],

                ),
              ),
            )),
      ),
    );
  }
}
