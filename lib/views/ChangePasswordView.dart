import 'package:MJN/controllers/changePasswordController.dart';
import 'package:MJN/utils/app_constants.dart';
import 'package:MJN/utils/app_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class ChangePasswordView extends StatelessWidget {
  var currentPasswordText = TextEditingController();
  var newPasswordText = TextEditingController();
  var rewriteNewPasswordText = TextEditingController();

  final ChangePasswordController changePasswordController =
  Get.put(ChangePasswordController());

  static const routeName = '/change_password';
  final loginDataStorage = GetStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 110,
        backgroundColor: Colors.white70,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        title: Text('Change Password',style: TextStyle(color: Colors.black),),
      ),
      backgroundColor: Colors.grey.shade100,
      body: GestureDetector(
        onTap: (){
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
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
                      controller: currentPasswordText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Current Password",
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
                      controller: newPasswordText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "New Password",
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
                      controller: rewriteNewPasswordText,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Rewrite New Password",
                      )),
                ),
              ),
              SizedBox(
                height: 35,
              ),
              Padding(
                  padding: EdgeInsets.only(left: 120, right: 120),
                  child: Obx(() {
                    if (changePasswordController.isLoading.value) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      return NeumorphicButton(
                        onPressed: () {
                          if (currentPasswordText.text == '' ||
                              newPasswordText.text == '' ||
                              rewriteNewPasswordText.text == '') {

                            AppUtils.showErrorSnackBar("Error!!", 'Data must not empty!!');
                          }
                          else {
                            Map<String, String> map = {
                              'current_password': currentPasswordText.value.text,
                              'new_password': newPasswordText.value.text,
                              'confirm_password': rewriteNewPasswordText.value
                                  .text,
                              'app_version': app_version,
                              'user_name': loginDataStorage.read(USER_NAME),
                            };

                            changePasswordController.changePassword(
                                map, loginDataStorage.read(TOKEN));
                          }

                        },
                        child: Center(

                          child: Text(
                            "Confirm",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Colors.white),
                          ),

                        ),
                        style: NeumorphicStyle(
                          shape: NeumorphicShape.flat,
                          boxShape: NeumorphicBoxShape.roundRect(
                              BorderRadius.circular(18)),
                          color: Colors.amber,
                          depth: 8,
//                lightSource: LightSource.topLeft,
                        ),
                      );
                    }
                  }))
            ],
          ),
        ),
      ),
    );
    ;
  }
}
